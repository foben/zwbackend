import Image
import pytesseract
import re
import sys

class ReceiptReader:
    receiptString = ''
    unparsedData = []

    def __init__(self, receiptImage):
        self.receiptString = pytesseract.image_to_string(Image.open(receiptImage), 'deu')
        self._preprocess()

    def _preprocess(self):
        unparsedData = re.split("\n", self.receiptString)
        for item in unparsedData:
            if item != "":
                self.unparsedData.append(item)
        #print self.unparsedData

    def getStoreName(self):
        data = self.unparsedData[0]
        #self.unparsedData.remove(0)
        return data

    def getPurchaseDate(self):
        data = self.unparsedData[1]
        return data

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

class ReceiptReader2:
    receiptString = ""
    unparsedData = []

    def __init__(self, receiptImage):
        self.receiptString = pytesseract.image_to_string(Image.open(receiptImage))
        self._preprocess()

    def _preprocess(self):
        unparsedData = re.split("\n", self.receiptString)
        for item in unparsedData:
            if item != "":
                self.unparsedData.append(item)
        #print self.unparsedData

    def status(self):
        for datum in self.unparsedData:
            print datum

    def getStoreName(self):
        data = self.unparsedData[0]
        #self.unparsedData.remove(0)
        return data

    def getReceiptItems(self):
        items = {}
        lastProduct = None
        isInItemsSection = False
        for line in self.unparsedData[1:]:
            if not isInItemsSection and re.match("[^ ]+ [0-9]+,[0-9]{2} B", line):
                isInItemsSection = True

            else:
                continue

            if lastProduct is not None and re.match("[0-9]+ X [0-9]+,[0-9]{2}", line) is not None:
                quantity = re.split(" ", line)[0]
                items[lastProduct][0] = quantity

            else:
                linePieces = re.split(" ", line)
                product = linePieces[0]

                if product == "SUMME":
                    break

                price = linePieces[1]
                items[product] = [0, price]
                lastProduct = product
        return items




if __name__ == "__main__":
    if len(sys.argv) == 1:
        """rr = ReceiptReader("kassenzettel4.jpg")
        print rr.getStoreName()
        print rr.getPurchaseDate()
        print rr.getReceiptItems()
        print rr.getSum()"""
        rr = ReceiptReader2("kassenzettel11.png")
        rr.status()
        print rr.getStoreName()
        print rr.getReceiptItems()
    else:
        print pytesseract.image_to_string(Image.open("kassenzettel11.png"))
