import calendar, time

def to_string_price(price):
    return "{0:.2f}".format(round(price,2)).replace('.',',')

def get_upload_file_name(filename):
    #TODO add error handling and less error prone file type detection
    image_type = filename.split('.')[-1]
    upload_filename = 'uploads/upload_' + str(calendar.timegm(time.gmtime())) + '.' + image_type
    return upload_filename
