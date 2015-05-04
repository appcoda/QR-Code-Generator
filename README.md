# A demo app for QR Code Generation

Prior to iOS 7, making a QR code generator was a real trouble. Not many resources existed back then, and most developers had to avoid creating their custom code; the easiest thing to do was to pick among 2-3 different existing libraries and fit it to their applications. But thankfully, all that is now history. By introducing iOS 7 time ago, Apple also turned any task related to QR codes (reading and generating) into a piece of cake. For reading QR codes, the AVFoundation framework is now the tool every developer needs. For generating, the only thing coders have to do is to use the Core Image framework, and more specifically the Core Image filters.

To make it perfectly clear, since iOS 7 a QR code is generated as a CIImage object (CoreImage image) simply by using a special filter named CIQRCodeGenerator. All it takes is to provide the data that you want to convert into a QR code image, and iOS will manage and do the heavy work.

For details, please refer to this tutorial:

http://www.appcoda.com/qr-code-generator-tutorial
