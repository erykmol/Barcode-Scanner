
# Food barcode scanner app

This is a food barcode scanner that allows user to scan barcodes of food products, see the details of the product such as ingredients, which it gets from a public food database Open Food Facts. It also keeps a history of  scans which allows user to quickly look up a product without the need to scan it again. App can scan and get information from EAN13 barcodes.

## Getting started

You will need an IOS device on which the app will be launched, and a Mac or Macbook with an Xcode installed that supports Swift 5 to be able to build the app. Also, because the app has a pods dependecy installed, you will want to open the project using Scanner.xcworkspace.

## Setting the app for your region
By default, the ingredients retrived from the database are in English, and if you want to have them displayed in another language, only thing you will need to change is `product["ingredients_text_en"]` in  the `DetailsViewController` to for example `product["ingredients_text_pl"]` to have the ingredients in Polish language.

## Demo
![Food Scanner Demo](demo/ScannerDemo.gif)

(Since I unfortunately didn't have any packaging left for this demo, I generated some barcodes online for scanning)
## Disclaimer
Because I'm using an open-source database, there are some discrepencies with for example formatting of the ingredients, or with the fact that some descriptive elements of the product are a part of those ingredients, which makes retrieveing/displaying details tricky.
