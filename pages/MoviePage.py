from selenium.webdriver.common.by import By

from pages.BasePage import BasePage

class MoviePage(BasePage):
   
    opener_film_page = (By.XPATH, "//a[contains(text(), '###')]")
    star_rate = (By.XPATH, '//div[@data-value="###"]')
    new_rate = (By.XPATH, "//div[@data-value='###']")
    del_rate = (By.CSS_SELECTOR, "i[title='Usuń ocenę']")
    rate_section = (By.CSS_SELECTOR, 'div.page__group[data-group="g3"]')

    def open_page(self, name):
        selector, path_ = self.opener_film_page
        path = path_.replace("###", name)
        self.click_element(selector, path)

    def rate_film(self, rate):
        selector, path_ = self.star_rate
        path = path_.replace("###", rate)
        try:
            self.click_element(selector, path)
        except:
            element = self.get_element_with_timeout(*self.rate_section)
            self.scroll_to_element(element)
            self.click_element(selector, path)

    def change_rate(self, rate):
        selector, path_ = self.new_rate
        path = path_.replace("###", rate)
        try:
            self.click_element(selector, path)
        except:
            element = self.get_element_with_timeout(*self.rate_section)
            self.scroll_to_element(element)
            self.click_element(selector, path)

    def delete_rate(self):
        try:
            self.click_element(*self.del_rate)
        except:
            element = self.get_element_with_timeout(*self.rate_section)
            self.scroll_to_element(element)
            self.click_element(*self.del_rate)
