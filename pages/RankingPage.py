from selenium.webdriver.common.by import By
from robot.api.deco import keyword

from pages.BasePage import BasePage

class RankingPage(BasePage):

    ranking = (By.CSS_SELECTOR, ".page__container.rankingTypeSection__container")
    ranking_element = (By.CSS_SELECTOR, "div[itemprop='itemListElement'][itemtype='https://schema.org/Movie']")

    @keyword
    def number_of_elements(self):
        return len(self.get_elements_in_ranking())

    @keyword
    def display_ranking(self):
        return self._get_ranking().is_displayed()

    @keyword
    def display_ranking_element(self):
        return self.get_elements_in_ranking()[0].is_displayed()

    def get_elements_in_ranking(self):
        ranking = self._get_ranking()
        elements = ranking.find_elements(*self.ranking_element)
        return elements

    @keyword
    def scroll_all_page(self):
        elements = self.get_elements_in_ranking()
        i = self.number_of_elements()
        while True:
            self.scroll_to_element(elements[i-2])
            if i < self.number_of_elements():
                i = self.number_of_elements()
            else:
                break
            elements = self.get_elements_in_ranking()

    def _get_ranking(self):
        return self.get_element_with_timeout(*self.ranking)
