from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.common.by import By

from lib.helpers import wait_random_after_operation

class BasePage:
    
    accept_cookies_button = (By.ID, "didomi-notice-agree-button")
    more_about_cookies_button = (By.ID, "didomi-notice-learn-more-button")
    reject_cookies_button = (By.XPATH, "//button[@aria-label='Nie akceptuj żadnego: Nie wyraź zgody na nasze przetwarzanie danych i zamknij']")
    skip_advertising_button = (By.CLASS_NAME, "ws__skip")

    def __init__(self, driver):
        self.driver = driver
        self.wait = WebDriverWait(driver, 10)

    def get_url(self, url):
        return self.driver.get(url)
    
    def refresh_site(self):
        return self.driver.refresh()
    
    def get_cookies(self):
        return self.driver.get_cookies()
    
    def add_cookies(self, cookies):
        for cookie in cookies:
            self.driver.add_cookie(cookie)
    
    def get_element_with_timeout(self, by_type: By, path):
        return self.wait.until(EC.visibility_of_element_located((by_type, path)))

    def get_element(self, by_type: By, path):
        return self.driver.find_element(by_type, path)

    @wait_random_after_operation()
    def click_element(self, by_type: By, path):
        button = self.get_element_with_timeout(by_type, path)
        button.click()

    @wait_random_after_operation()
    def enter_text(self, by_type: By, path, text):
        input = self.get_element_with_timeout(by_type, path)
        input.clear()
        input.send_keys(text)

    def accept_cookies(self):
        self.click_element(*self.accept_cookies_button)

    def reject_cookies(self):
        self.click_element(*self.more_about_cookies_button)
        self.click_element(*self.reject_cookies_button)

    def skip_advertising(self):
        self.click_element(*self.skip_advertising_button)
