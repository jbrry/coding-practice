# This file contains a non-golfed solution.

import sys

STRIKE = "X"
SPARE = "/"

FOULS = ["-", "F"]
SPLITS = ["\u2464", "\u2465", "\u2466", "\u2467"]

SPLIT_TO_INT = {
    "⑤": 5,
    "⑥": 6,
    "⑦": 7,
    "⑧": 8,
}


class BowlingGame:
    def __init__(self) -> None:
        self.total = 0
        self.rolls = [0] * 21
        self.current_roll = 0

    def sum_of_balls_in_frame(self, frame_idx: int):
        return self.rolls[frame_idx] + self.rolls[frame_idx + 1]

    def spare_bonus(self, frame_idx: int):
        return self.rolls[frame_idx + 2]

    def strike_bonus(self, frame_idx: int):
        return self.rolls[frame_idx + 1] + self.rolls[frame_idx + 2]

    def is_spare(self, frame_idx: int):
        return self.rolls[frame_idx] + self.rolls[frame_idx + 1] == 10

    def is_strike(self, frame_idx: int):
        return self.rolls[frame_idx] == 10

    def roll(self, pins: int):
        self.rolls[self.current_roll] = pins
        self.current_roll += 1

    def score(self):
        frame_idx = 0
        for frame in range(10):
            if self.is_strike(frame_idx):
                self.total += 10 + self.strike_bonus(frame_idx)
                frame_idx += 1
            elif self.is_spare(frame_idx):
                self.total += 10 + self.spare_bonus(frame_idx)
                frame_idx += 2
            else:
                self.total += self.sum_of_balls_in_frame(frame_idx)
                frame_idx += 2
        return self.total

    def string_to_int(self, raw):
        decoded = []
        for x in raw:
            if x == STRIKE:
                decoded.append(10)
            elif x in FOULS:
                decoded.append(0)
            elif x in SPLITS:
                decoded.append(SPLIT_TO_INT[x])
            elif x == SPARE:
                remainder = 10 - int(decoded[-1])
                decoded.append(remainder)
            else:
                decoded.append(int(x))
        return decoded

    def parse_codegolf_format(self, text):
        raw = []
        for frame in text.strip().split():
            for roll in frame:
                raw.append(roll)
        rolls = self.string_to_int(raw)
        return rolls


for arg in sys.argv[1:]:
    game = BowlingGame()
    rolls = game.parse_codegolf_format(arg)
    for roll in rolls:
        game.roll(roll)
    print(game.score())
