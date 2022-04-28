import   SeleniumLibrary
from selenium import webdriver
from robot.api.deco import library, keyword
from robot.libraries.BuiltIn import BuiltIn
from webdriver_manager.chrome import ChromeDriverManager
from webdriver_manager.microsoft import EdgeChromiumDriverManager


def get_driver_path(browser):
    if browser == "Edge":
        driver_path = EdgeChromiumDriverManager().install()
        print(driver_path)
    elif browser == "Chrome":
        driver_path = ChromeDriverManager().install()
        print(driver_path)
    return driver_path
