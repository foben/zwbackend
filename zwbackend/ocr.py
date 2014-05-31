import Image
import pytesseract
import subprocess
import os

class OcrReader:
    def get_non_empty_lines(self, filename):
        #TODO evaluate deu vs. eng language
        image_string = pytesseract.image_to_string(Image.open(filename), 'eng')
        non_empty_lines = [line for line in image_string.split('\n') if line != ""]
        return non_empty_lines

class PreprocessingOcrReader:
    def get_non_empty_lines(self, filename):
        #TODO finish implementation
        out_directory = os.path.dirname(filename)
        # scantailor-cli documentation: http://diy-ebook-creator.googlecode.com/git-history/96d965c8695aa144d91475f90f2aefdaab92789f/diy/stcli.txt
        return_code = subprocess.call(["scantailor-cli", filename, "-l=1.5", "-o", out_directory])
        print "scantailor-cli return code: %d" % return_code
        image_string = pytesseract.image_to_string(Image.open(filename[:-3] + "tif"))
        non_empty_lines = [line for line in image_string.split('\n') if line != ""]
        return non_empty_lines
