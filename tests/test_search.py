from urllib.parse import quote
import pytest

from pages.SearchPage import SearchPage

class TestSearch:

    @pytest.fixture(autouse=True)
    def setup_method(self, auth_driver):
        self.search_page = SearchPage(auth_driver)
        self.search_page.open_search_window()

    @pytest.mark.parametrize("name", [
    "Chłopi",
    "Siedem dusz",
    "Nietykalni"
    ])
    def test_search_movie(self, name):
        self.search_page.enter_search_input(name)
        self.search_page.click_element_field(name)
        current_url = self.search_page.check_current_url()
        condition = all(quote(word) in current_url for word in name.split(' '))
        assert condition, f"Wrong URL: {current_url}"
        assert name == self.search_page.get_title()

    @pytest.mark.parametrize("name", [
    "Breaking Bad",
    "Gra o tron",
    "Ranczo"
    ])
    def test_search_tvseries(self, name):
        self.search_page.enter_search_input(name)
        self.search_page.click_element_field(name)
        current_url = self.search_page.check_current_url()
        condition = all(quote(word) in current_url for word in name.split(' '))
        assert condition, f"Wrong URL: {current_url}"
        assert name == self.search_page.get_title()

    @pytest.mark.parametrize("name", [
    "Angelina Jolie",
    "Brad Pitt",
    "Małgorzata Kożuchowska"
    ])
    def test_search_actor(self, name):
        self.search_page.enter_search_input(name)
        self.search_page.click_element_field(name)
        current_url = self.search_page.check_current_url()
        condition = all(quote(word) in current_url for word in name.split(' '))
        assert condition, f"Wrong URL: {current_url}"
