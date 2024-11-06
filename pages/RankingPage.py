from selenium.webdriver.common.by import By

from pages.BasePage import BasePage

class RankingPage(BasePage):
    
    ranking = (By.CSS_SELECTOR, ".page__container.rankingTypeSection__container")

    def display_ranking(self):
        ranking = self.get_element_with_timeout(*self.ranking)
        return ranking.is_displayed()