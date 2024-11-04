from selenium.webdriver.common.by import By
import logging
import time

from pages.BasePage import BasePage

class MoviePage(BasePage):
   
    opener_film_page = (By.XPATH, "//a[contains(text(), '###')]")
    star_rate = (By.XPATH, '//div[@data-value="###" and .//i[contains(@class, "ico--starRotate")]]')
    change_rate = (By.XPATH, '//div[@data-value="###" and .//i[contains(@class, "ico--starSolidRotate")]]')
    del_rate = (By.CSS_SELECTOR, "i[title='Usuń ocenę']")
    second_section = (By.CSS_SELECTOR, 'div.page__group[data-group="g2"]')
    rate_text = (By.CSS_SELECTOR, ".sc-DWsrX.bMHBPq")
    heart = (By.XPATH, '//div[@data-value="1" and .//i[contains(@class, "ico--like")]]')
    cliecked_heart = (By.XPATH, '//div[@data-value="1" and .//i[contains(@class, "ico--likeSolid")]]')

    def open_page(self, name):
        selector, path_ = self.opener_film_page
        path = path_.replace("###", name)
        self.click_element(selector, path)

    def rate_film(self, rate):
        selector, path_ = self.star_rate
        path = path_.replace("###", rate)    
        self.click_element(selector, path)

    def change_rate_film(self, rate):
        selector, path_ = self.change_rate
        path = path_.replace("###", rate)    
        self.click_element(selector, path)

    def delete_rate(self):
        self.click_element(*self.del_rate)

    def give_heart(self):
        self.click_element(*self.heart)

    def delete_heart(self):
        self.click_element(*self.cliecked_heart)

    def scroll_to_rating_section(self):
        try:
            if self.get_screen_width() > 1151:
                pass
            else:
                element = self.get_element_with_timeout(*self.second_section)
                self.scroll_to_element(element)
        except:
            logging.error("Rating section not found")
    
    def check_rate(self):
        return self.get_element(*self.rate_text).text
    
    def is_heart_clicked(self):
        try:
            self.get_element_with_timeout(*self.cliecked_heart)
            return True
        except:
            return False

