# Build script for Evothings Example apps.
#
# How to run:
# ruby build.rb
#

require 'fileutils'

include FileUtils::Verbose

###### Examples ######

def buildArduinoBLE
	destPath = 'examples/arduino-ble/app'
	copyUI(destPath)
	copyJQuery(destPath)
	copyWhereIsTheArduinoCode(destPath)
end

def buildArduinoInputTCP
	# Copy CSS/JS files.
	destPath = 'examples/arduino-input-tcp/app'
	copyUI(destPath)
	copyJQuery(destPath)
	copyArduinoTCP(destPath)
	copyWhereIsTheArduinoCode(destPath)

	# Copy Arduino files.
	destPath = 'examples/arduino-input-tcp'
	copyArduinoEthernet(destPath)
	copyArduinoWiFi(destPath)
end

def buildArduinoLEDOnOffBLE
	destPath = 'examples/arduino-led-onoff-ble/app'
	copyUI(destPath)
	copyJQuery(destPath)
	copyEasyBLE(destPath)
	copyArduinoBLE(destPath)
	copyWhereIsTheArduinoCode(destPath)
end

def buildArduinoLEDOnOffTCP
	# Copy CSS/JS files.
	destPath = 'examples/arduino-led-onoff-tcp/app'
	copyUI(destPath)
	copyJQuery(destPath)
	copyArduinoTCP(destPath)
	copyWhereIsTheArduinoCode(destPath)

	# Copy Arduino files.
	destPath = 'examples/arduino-led-onoff-tcp'
	copyArduinoEthernet(destPath)
	copyArduinoWiFi(destPath)
end

def buildArduinoScriptableTCP
	# Copy CSS/JS files.
	destPath = 'examples/arduino-scriptable-tcp/app'
	copyUI(destPath)
	copyJQuery(destPath)
	copyArduinoTCP(destPath)
	copyWhereIsTheArduinoCode(destPath)

	# Copy Arduino files.
	destPath = 'examples/arduino-scriptable-tcp'
	copyArduinoEthernet(destPath)
	copyArduinoWiFi(destPath)
end

def buildBLEScan
	destPath = 'examples/ble-scan'
	copyUI(destPath)
	copyJQuery(destPath)
end

def buildTISensorTagDemo
	destPath = 'examples/ti-sensortag-demo'
	copyUI(destPath)
	copyJQuery(destPath)
	copyEasyBLE(destPath)
end

def buildTISensorTagSensors
	destPath = 'examples/ti-sensortag-sensors'
	copyUI(destPath)
	copyUtil(destPath)
	copyEasyBLE(destPath)
	copyTISensorTag(destPath)
end

def buildCordovaBasic
	destPath = 'examples/cordova-basic'
	copyUI(destPath)
	copyJQuery(destPath)
end

def buildHelloWorld
	destPath = 'examples/hello-world'
	copyUI(destPath)
end

def buildHueLights
	destPath = 'examples/hue-lights'
	copyUI(destPath)
	copyJQuery(destPath)
end

def buildIBeaconScan
	destPath = 'examples/ibeacon-scan'
	copyUI(destPath)
	copyJQuery(destPath)
end

def buildNordicBLE
	destPath = 'examples/nordic-ble'
	copyUI(destPath)
	copyJQuery(destPath)
	copyEasyBLE(destPath)
	copyNordicBLE(destPath)
end

def buildRFduinoLEDOnOff
	destPath = 'examples/rfduino-led-onoff/app'
	copyUI(destPath)
	copyJQuery(destPath)
	copyEasyBLE(destPath)
	copyRFduinoBLE(destPath)
	copyWhereIsTheArduinoCode(destPath)
end

###### Copy helpers ######

### CSS/JS ###

def copyUI(destPath)
	copyDir('resources/ui', destPath)
end

def copyJQuery(destPath)
	copyDir('resources/libs/jquery', destPath + '/libs')
end

def copyEasyBLE(destPath)
	copyDir('resources/libs/evothings/easyble', destPath + '/libs/evothings')
end

def copyArduinoBLE(destPath)
	copyDir('resources/libs/evothings/arduinoble', destPath + '/libs/evothings')
end

def copyArduinoTCP(destPath)
	copyDir('resources/libs/evothings/arduinotcp', destPath + '/libs/evothings')
end

def copyNordicBLE(destPath)
	copyDir('resources/libs/evothings/nordicble', destPath + '/libs/evothings')
end

def copyRFduinoBLE(destPath)
	copyDir('resources/libs/evothings/rfduinoble', destPath + '/libs/evothings')
end

def copyTISensorTag(destPath)
	copyDir('resources/libs/evothings/tisensortag', destPath + '/libs/evothings')
end

def copyUtil(destPath)
	copyDir('resources/libs/evothings/util', destPath + '/libs/evothings')
end

def copyWhereIsTheArduinoCode(destPath)
	copyFile(
		'resources/txt/where-is-the-arduino-code.txt',
		destPath + '/where-is-the-arduino-code.txt')
end

### Arduino .ino files ###

def copyArduinoEthernet(destPath)
	copyDir('resources/arduino/arduinoethernet', destPath + '/arduinoethernet')
end

def copyArduinoWiFi(destPath)
	copyDir('resources/arduino/arduinowifi', destPath + '/arduinowifi')
end

### General copy methods ###

def copyDir(srcPath, destPath)
	mkpath(destPath)
	cp_r(srcPath, destPath)
end

def copyFile(srcPath, destPath)
	cp(srcPath, destPath)
end

###### Script entry point ######

def build
	buildArduinoBLE
	buildArduinoInputTCP
	buildArduinoLEDOnOffBLE
	buildArduinoLEDOnOffTCP
	buildArduinoScriptableTCP
	buildBLEScan
	buildCordovaBasic
	buildHelloWorld
	buildHueLights
	buildIBeaconScan
	buildNordicBLE
	buildRFduinoLEDOnOff
	buildTISensorTagDemo
	buildTISensorTagSensors
end

build