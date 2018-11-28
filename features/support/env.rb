require "appium_lib"
require "pry"

# def caps
#     { caps: {
#         deviceName: "Anyname",
#         platformName: "Android",
#         app: (File.join(File.dirname(__FILE__), "PreciseUnitConversion.apk")),
#         appPackage: "com.ba.universalconverter",
#         appActivity: "MainConverterActivity",
#         newCommandTimeout: "3600"
#     }}
# end

def caps
  {
    caps: {
        # The generated session will be visible to you only.
      sessionName: 'Automation test session',
      sessionDescription: '',
      deviceOrientation: 'portrait',
      captureScreenshots: true,
        # The maximum size of application is 500MB
        # By default, HTTP requests from testing library are expired
        # in 2 minutes while the app copying and installation may
        # take up-to 30 minutes. Therefore, you need to extend the HTTP
        # request timeout duration in your testing library so that
        # it doesn't interrupt while the device is being initialized.
      app: 'kobiton-store:20828',

      deviceGroup: 'KOBITON',
        # For deviceName, platformVersion Kobiton supports wildcard
        # character *, with 3 formats: *text, text* and *text*
        # If there is no *, Kobiton will match the exact text provided
      deviceName: 'Nexus 5X',
      platformName: 'Android',
      platformVersion: '8.1.0',
      appPackage: 'com.ba.universalconverter',
      appActivity: 'MainConverterActivity',
      newCommandTimeout: '3600'
    },
    appium_lib: {
      server_url: 'https://gilberto.sanchez+002:7878080f-00ac-45b2-85ec-34cd2091401a@api.kobiton.com/wd/hub'
    }
  }
end

Appium::Driver.new(caps, true)
Appium.promote_appium_methods Object


def find_in_list(value)
  3.times {Appium::TouchAction.new.swipe(start_x: 0.5, start_y: 0.2, end_x: 0.5, end_y: 0.8, duration: 600).perform}

  current_screen = get_source
  previous_screen = ""

  until (exists {text(value)}) || (current_screen == previous_screen) do
    Appium::TouchAction.new.swipe(start_x: 0.5, start_y: 0.8, end_x: 0.5, end_y: 0.4, duration: 1000).perform
    previous_screen = current_screen
    current_screen = get_source
  end

  if exists {text(value)}
    text(value).click
  else
    fail("Cannot find element with text #{value}")
  end

end
