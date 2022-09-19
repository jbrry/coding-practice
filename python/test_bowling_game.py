import pytest

from bowling_game import BowlingGame


@pytest.fixture
def game():
    return BowlingGame()


def roll_many(g, n: int, pins: int):
    for i in range(n):
        g.roll(pins)


def test_gutter_game(game):
    roll_many(game, 20, 0)
    assert 0 == game.score()


def test_all_ones(game):
    roll_many(game, 20, 1)
    assert 20 == game.score()


def test_one_spare(game):
    roll_spare(game)
    game.roll(3)
    roll_many(game, 17, 0)
    assert 16 == game.score()


def test_one_strike(game):
    roll_strike(game)
    game.roll(3)
    game.roll(4)
    roll_many(game, 16, 0)
    assert 24 == game.score()


def test_perfect_game(game):
    roll_many(game, 12, 10)
    assert 300 == game.score()


def roll_spare(g):
    g.roll(5)
    g.roll(5)


def roll_strike(g):
    g.roll(10)
