import pytest
from selenium.webdriver.common.by import By
from selenium import webdriver


@pytest.mark.usefixtures("setup")
class Test:

    def test_one(self, setup):
        self.driver.find_element(By.NAME, 'q')

# with open('test.txt')  as file:
#     read = file.readlines()
#     with open('test.txt', 'w') as writer:
#         for line in reversed(read):
#             writer.write(line)
