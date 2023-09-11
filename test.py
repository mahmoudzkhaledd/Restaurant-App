import base64

with open(r'E:\Restaurant-App\bimage.jpg', 'rb') as image_file:
    binary_data = image_file.read()

    encoded_image = base64.b64encode(binary_data).decode('utf-8')
    print("mn ta7tyyyyyy")
    print(encoded_image)

    