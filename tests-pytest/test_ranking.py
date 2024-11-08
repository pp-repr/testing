import pytest

from pages.RankingPage import RankingPage
from lib.config import BASE_URL

class TestRanking:
    
    @pytest.fixture(autouse=True)
    def setup_method(self, driver):
        self.ranking_page = RankingPage(driver)
        self.ranking_page.get_url(BASE_URL+"/ranking/film")
        self.ranking_page.reject_cookies()
        self.ranking_page.skip_advertising()

    def test_display_ranking(self):
        assert self.ranking_page.display_ranking(), "Ranking not found"