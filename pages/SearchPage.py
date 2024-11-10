from selenium.webdriver.common.by import By
from robot.api.deco import keyword

from pages.BasePage import BasePage

class SearchPage(BasePage):

    search_input_button = (By.CSS_SELECTOR, "input#inputSearch")
    search_opener_button = (By.CSS_SELECTOR, "button#searchOpener")
    search_input = (By.CSS_SELECTOR, 'input[placeholder="Szukaj"]')
    element_field = (By.XPATH, '//img[@alt="###"]')
    film_name = (By.CLASS_NAME, "filmCoverSection__title")

    @keyword
    def open_search_window(self):
        if self.get_screen_width() > 1151:
            self.click_element(*self.search_input_button)
        else:
            self.click_element(*self.search_opener_button)

    @keyword
    def enter_search_input(self, text):
        return self.enter_text(*self.search_input, text)

    @keyword
    def click_element_field(self, name):
        selector, path_ = self.element_field
        path = path_.replace("###", name)
        self.click_element(selector, path)

    @keyword
    def get_title(self):
        return self.get_element_with_timeout(*self.film_name).text
