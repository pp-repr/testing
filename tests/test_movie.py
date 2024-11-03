from urllib.parse import quote
import pytest
import time

from pages.MoviePage import MoviePage
from lib.config import BASE_URL

class TestMovie:

    @pytest.fixture(autouse=True)
    def setup_method(self, auth_driver):
        self.movie_page = MoviePage(auth_driver)
    
    @pytest.mark.parametrize("name, rate", [
    ("Chłopi", "9"),
    ("Siedem dusz", "8"),
    ("Nietykalni", "7")
    ])
    def test_rate_movie(self, name, rate):
        self.movie_page.get_url(BASE_URL + f"/search#/?query={quote(name)}")
        self.movie_page.open_page(name)
        time.sleep(5)
        self.movie_page.rate_film(rate)

    @pytest.mark.parametrize("name, rate", [
    ("Chłopi", "8"),
    ("Siedem dusz", "7"),
    ("Nietykalni", "6")
    ])
    def test_change_rate_movie(self, name, rate):
        self.movie_page.get_url(BASE_URL + f"/search#/?query={quote(name)}")
        self.movie_page.open_page(name)
        time.sleep(5)
        self.movie_page.change_rate(int(rate))

    @pytest.mark.parametrize("name", [
    "Chłopi",
    "Siedem dusz",
    "Nietykalni",
    ])
    def test_delete_rate_movie(self, name):
        self.movie_page.get_url(BASE_URL + f"/search#/?query={quote(name)}")
        self.movie_page.open_page(name)
        time.sleep(5)
        self.movie_page.delete_rate()
