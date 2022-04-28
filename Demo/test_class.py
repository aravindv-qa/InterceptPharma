import pytest


@pytest.mark.usefixtures("dataloads")
class TestExam:

    def test_fu(self, dataloads):
        print("TC001")
        print(dataloads[-1])

# from selenium.webdriver.common.by import By
# from selenium import webdriver
#
#
# @pytest.mark.usefixtures("dataloads")
# class Delta:
#
#     def test_demo(self, dataloads):
#         print("Sample")
#         print(dataloads

# @pytest.mark.usefixtures("setup")
# class Test:
#
#     def test_one(self, setup):
#         self.driver.find_element(By.NAME,'q')


# with open('test.txt')  as file:
#     read = file.readlines()
#     with open('test.txt', 'w') as writer:
#         for line in reversed(read):
#             writer.write(line)
