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
    ("Lista Schindlera", "6"),
    ("Służące", "7"),
    ("Incepcja", "8")
    ])
    def test_rate_movie(self, name, rate):
        self.movie_page.get_url(BASE_URL + f"/search#/?query={quote(name)}")
        self.movie_page.open_page(name)
        time.sleep(3)
        self.movie_page.scroll_to_rating_section()
        assert self.movie_page.check_rate() == ("moja ocena:" or "brak oceny"), "Movie has rate"
        self.movie_page.rate_film(rate)
        assert self.movie_page.check_rate() != ("moja ocena:" or "brak oceny"), "Movie has not rate"

    @pytest.mark.parametrize("name, rate", [
    ("Lista Schindlera", "8"),
    ("Służące", "8"),
    ("Incepcja", "9")
    ])
    def test_change_rate_movie(self, name, rate):
        self.movie_page.get_url(BASE_URL + f"/search#/?query={quote(name)}")
        self.movie_page.open_page(name)
        time.sleep(3)
        self.movie_page.scroll_to_rating_section()
        assert self.movie_page.check_rate() != ("moja ocena:" or "brak oceny"), "Movie has not rate"
        self.movie_page.change_rate_film(rate)
        assert self.movie_page.check_rate() != ("moja ocena:" or "brak oceny"), "Movie has not rate"

    @pytest.mark.parametrize("name", [
    "Lista Schindlera",
    "Służące",
    "Incepcja",
    ])
    def test_delete_rate_movie(self, name):
        self.movie_page.get_url(BASE_URL + f"/search#/?query={quote(name)}")
        self.movie_page.open_page(name)
        time.sleep(3)
        self.movie_page.scroll_to_rating_section()
        assert self.movie_page.check_rate() != ("moja ocena:" or "brak oceny"), "Movie has not rate"
        self.movie_page.delete_rate()
        assert self.movie_page.check_rate() == ("moja ocena:" or "brak oceny"), "Movie has rate"

    @pytest.mark.parametrize("name", [
    "Coco",
    "Wyspa tajemnic",
    "Green Book",
    ])
    def test_give_heart(self, name):
        self.movie_page.get_url(BASE_URL + f"/search#/?query={quote(name)}")
        self.movie_page.open_page(name)
        time.sleep(3)
        self.movie_page.scroll_to_rating_section()
        assert not self.movie_page.is_heart_clicked(), "Heart is clicked"
        self.movie_page.give_heart()
        assert self.movie_page.is_heart_clicked(), "Heart is not clicked"

    @pytest.mark.parametrize("name", [
    "Coco",
    "Wyspa tajemnic",
    "Green Book",
    ])
    def test_delete_heart(self, name):
        self.movie_page.get_url(BASE_URL + f"/search#/?query={quote(name)}")
        self.movie_page.open_page(name)
        time.sleep(3)
        self.movie_page.scroll_to_rating_section()
        assert self.movie_page.is_heart_clicked(), "Heart is not clicked"
        self.movie_page.delete_rate()
        assert not self.movie_page.is_heart_clicked(), "Heart is cliecked"
