import Image
import pytesseract
import re

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


if __name__ == "__main__":
    rr = ReceiptReader("kassenzettel4.jpg")
    print rr.getStoreName()
    print rr.getPurchaseDate()
    print rr.getReceiptItems()
    print rr.getSum()
