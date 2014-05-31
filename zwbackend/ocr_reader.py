import Image
import pytesseract
import re
import sys, subprocess
import time, datetime

from flask import jsonify

from zwbackend import purchase, ocr

def do_ocr(filename):
    # 1. OCR
    reader = ocr.OcrReader()
    #reader = ocr.PreprocessingOcrReader()
    non_empty_lines = reader.get_non_empty_lines(filename)
    # 2. Information extraction using a receipt reader
    rreader = ReweReceiptReader(non_empty_lines)
    store = rreader.getStoreName()
    items = rreader.getReceiptItems()
    timestamp = rreader.getPurchaseDate()
    # 3. Persisting purchase to db
    purchase.create_purchase_from_zettel(timestamp, store, items) 
    result = {'store': store, 'time': timestamp, 'items': items}
    return jsonify(result)

class DummyReceiptReader:
    receiptString = ''
    unparsedData = []

    def __init__(self, non_empty_lines):
        self.unparsedData = non_empty_lines

    def getStoreName(self):
        if len(self.unparsedData) == 0:
            return "Nuuttin'"
        data = self.unparsedData[0]
        #self.unparsedData.remove(0)
        return data

    def getPurchaseDate(self):
        data = datetime.datetime.strptime(self.unparsedData[1], '%d.%m.%y %H:%M Uhr')
        data = time.mktime(data.timetuple())
        #print self.unparsedData[1] + " -- " + time.strftime('%d.%m.%y %H:%M Uhr')
        return int(data)

    # Returns items
    # {productName: [quantity, price], ...}
    def getReceiptItems(self):
        items = {}
        readingQuantities = False
        itemIdCounter = 0
        maxItemIdCounter = 0

        for i in range(2, len(self.unparsedData)):
            if self.unparsedData[i] == "Gesamt":
                readingQuantities = True
                maxItemIdCounter = i-2
                continue

            if not readingQuantities:
                productPieces = re.split(" ", self.unparsedData[i])
                productPieces[0] = productPieces[0][:1]
                items[productPieces[1]] = [productPieces[0], 0.0]
            # quantities begin
            else:
                if itemIdCounter == maxItemIdCounter:
                    break

                productPieces = re.split(" ", self.unparsedData[2+itemIdCounter])
                items[productPieces[1]][1] = float(self.unparsedData[i]) # product => quantity
                itemIdCounter += 1

        return items

    def getSum(self):
        data = self.unparsedData[len(self.unparsedData)-1]
        return float(data)

class ReweReceiptReader:
    #receiptString = ""
    #unparsedData = []

    def __init__(self, non_empty_lines):
        self.unparsedData = non_empty_lines

    def status(self):
        for datum in self.unparsedData:
            print datum

    def getStoreName(self):
        if len(self.unparsedData) == 0:
            return "Nuttin'"
        data = self.unparsedData[0]
        #self.unparsedData.remove(0)
        return data

    def getPurchaseDate(self):
        data = time.time()
        return int(data)

    def getReceiptItems(self):
        items = {}
        lastProduct = None
        isInItemsSection = False
        for line in self.unparsedData:
            if not isInItemsSection and re.match("[^ ]+ [0-9]+,[0-9]{2} B", line):
                isInItemsSection = True

            elif not isInItemsSection:
                continue

            if lastProduct is not None and re.match("[0-9]+ X [0-9]+,[0-9]{2}", line) is not None:
                quantity = re.split(" ", line)[0]
                items[lastProduct][0] = int(quantity)

            else:
                linePieces = re.split(" ", line)
                product = re.split("[0-9]+,[0-9]{2}", line)[0].strip()

                if re.match("SUMME", product):
                    break

                price = float(linePieces[-2].replace(",", "."))
                items[product] = [1, price]
                lastProduct = product

            #print line


        #for line in self.unparsedData:
        #    print line

        return items

    def getSum(self):
        for line in self.unparsedData:
            data = re.match("SUMME EUR [0-9]+,[0-9]{2}", line)
            if data is not None:
                data = data.group(0).split(" ")[-1].replace(",", ".")
                break
        return float(data)


class ReweReceiptReader2:
    #receiptString = ""
    #unparsedData = []

    def __init__(self, non_empty_lines):
        self.unparsedData = non_empty_lines

    def status(self):
        for datum in self.unparsedData:
            print datum

    def getStoreName(self):
        if len(self.unparsedData) == 0:
            return "Nuttin'"
        data = self.unparsedData[0]
        #self.unparsedData.remove(0)
        return data

    def getPurchaseDate(self):
        data = time.time()
        return int(data)

    def getReceiptItems(self):
        items = {}
        lastProduct = None
        isInItemsSection = False
        for line in self.unparsedData[:-1]:
            if not isInItemsSection and re.match("[^ ]+ [0-9]+,[0-9]{2} B", line):
                isInItemsSection = True

            elif not isInItemsSection:
                continue

            if lastProduct is not None and re.match("[0-9]+ X [0-9]+,[0-9]{2}", line) is not None:
                quantity = re.split(" ", line)[0]
                items[lastProduct][0] = int(quantity)

            else:
                linePieces = re.split(" ", line)

                product = None
                if re.search("[0-9]+,[0-9]{2}", line) is not None:
                    product = re.split("[0-9]+,[0-9]{2}", line)[0].strip()
                elif re.search("[0-9]+.[0-9]{2}", line) is not None:
                    product = re.split("[0-9]+.[0-9]{2}", line)[0].strip()

                #if re.match("SUMME", product):
                #    break

                price = float(linePieces[-2].replace(",", "."))
                items[product] = [1, price]
                lastProduct = product

            #print line


        #for line in self.unparsedData:
        #    print line

        return items

    def getSum(self):
        for line in self.unparsedData:
            data = re.match("SUMME EUR [0-9]+,[0-9]{2}", line)
            if data is not None:
                data = data.group(0).split(" ")[-1].replace(",", ".")
                break
        return float(data)




if __name__ == "__main__":
    if len(sys.argv) == 2 and sys.argv[1] == "rewe":
        """rr = ReceiptReader("kassenzettel4.jpg")
        print rr.getStoreName()
        print rr.getPurchaseDate()
        print rr.getReceiptItems()
        print rr.getSum()"""
        rr = ReweReceiptReader("../receipts/kassenzettel11.png")
        #rr = ReweReceiptReader("../receipts/kassenzettel16.tif")
        #rr.status()
        print rr.getStoreName()
        print rr.getPurchaseDate()
        print rr.getReceiptItems()
        print rr.getSum()
    elif len(sys.argv) == 2 and sys.argv[1] == "dummy":
        rr = DummyReceiptReader("../receipts/kassenzettel6.jpg")
        print rr.getStoreName()
        print rr.getPurchaseDate()
        print rr.getReceiptItems()
        print rr.getSum()
    elif len(sys.argv) == 2 and sys.argv[1] == "rewe2":
        #rr = ReweReceiptReader("../receipts/kassenzettel11.png")
        rr = ReweReceiptReader2("../receipts/kassenzettel17.jpg")
        #rr.status()
        print rr.getStoreName()
        print rr.getPurchaseDate()
        print rr.getReceiptItems()
        #print rr.getSum()
    else:
        print pytesseract.image_to_string(Image.open("../receipts/kassenzettel16.tif"))
