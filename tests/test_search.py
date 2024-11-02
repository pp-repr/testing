from urllib.parse import quote
import pytest

from pages.SearchPage import SearchPage

class TestSearch:

    @pytest.mark.parametrize("name", [
    "Angelina Jolie",
    "Gra o tron",
    "Nietykalni"
    ])
    def test_run(self, auth_driver, name):
        search_page = SearchPage(auth_driver)
        search_page.open_search_window()
        search_page.enter_search_input(name)
        search_page.click_element_field(name)
        condition = all(quote(word) in search_page.check_current_url() for word in name.split(' '))
        assert condition, f"Wrong URL: {search_page.check_current_url()}"
