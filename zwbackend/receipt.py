from flask import jsonify

from zwbackend import ocr, extraction

class Receipt:
    def __init__(self, store, timestamp, items):
        self.store = store
        self.timestamp = timestamp
        self.items = items

    def to_dict(self):
        return {'store': self.store, 'time': self.timestamp, 'items': self.items}

    def to_json(self):
        return jsonify(self.to_dict())

def extract_from_image(filename):
    # 1. OCR
    ocr_reader = ocr.OcrReader() # ocr.PreprocessingOcrReader()
    non_empty_lines = ocr_reader.get_non_empty_lines(filename)
    # 2. Information extraction using a receipt reader
    rreader = extraction.ReweReceiptReader(non_empty_lines)
    store = rreader.getStoreName()
    items = rreader.getReceiptItems()
    timestamp = rreader.getPurchaseDate()
    return Receipt(store, timestamp, items)
