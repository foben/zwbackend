import os
import ocr

def evaluate_recall(gold_standard, ocr_lines):
    matched = sum([(gs_line in ocr_lines) for gs_line in gold_standard])
    print "%d out of %d lines are correct" % (matched, len(gold_standard))

def contains_levenshtein_distance_item(gs_line, ocr_lines, max_distance):
    return any([(levenshtein(gs_line, line) <= max_distance) for line in ocr_lines])

def evaluate_recall_levenshtein(gold_standard, ocr_lines, max_distance):
    matched = sum([contains_levenshtein_distance_item(gs_line, ocr_lines, max_distance) for gs_line in gold_standard])
    print "%d out of %d lines with levenshtein <= %d" % (matched, len(gold_standard), max_distance)

""" 
Copied first implementation from http://en.wikibooks.org/wiki/Algorithm_Implementation/Strings/Levenshtein_distance#Python
"""
def levenshtein(s1, s2):
    if len(s1) < len(s2):
        return levenshtein(s2, s1)
 
    # len(s1) >= len(s2)
    if len(s2) == 0:
        return len(s1)
 
    previous_row = xrange(len(s2) + 1)
    for i, c1 in enumerate(s1):
        current_row = [i + 1]
        for j, c2 in enumerate(s2):
            insertions = previous_row[j + 1] + 1 # j+1 instead of j since previous_row and current_row are one character longer
            deletions = current_row[j] + 1       # than s2
            substitutions = previous_row[j] + (c1 != c2)
            current_row.append(min(insertions, deletions, substitutions))
        previous_row = current_row
 
    return previous_row[-1]

rewe_lines = ['REWE', 
        'TAGLIA.WILDLACHS 4,98 B',
        '2 X 2,49',
        'JA ! AUFSCHNITT 1,39 B',
        'BIO MEHRKORNBR. 2,25 B',
        'MEHRKONSCHNITTE 1,65 B',
        'KRONE LACHS 3,99 B',
        'KNOBL.NEUTRAL 0,99 B',
        'APFEL SCIFRESH 1,29 B',
        'MANGO BIO 2,29 B',
        'CHERRYTOMATE BIO 1,29 B',
        'KIWI BIO 1,29 B',
        'BLAETTERTEIG 1,75 B',
        'SUMME EUR 23,16']

if __name__ == "__main__":
    filename = os.path.abspath("../uploads/rewe.png")
    reader = ocr.OcrReader()
    #reader = ocr.PreprocessingOcrReader()
    lines = reader.get_non_empty_lines(filename)
    for l in lines: print l
    evaluate_recall(rewe_lines, lines)
    evaluate_recall_levenshtein(rewe_lines, lines, 1)
    evaluate_recall_levenshtein(rewe_lines, lines, 2)
    evaluate_recall_levenshtein(rewe_lines, lines, 3)
