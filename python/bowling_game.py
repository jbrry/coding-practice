# Replication of the Java version: http://www.butunclebob.com/ArticleS.UncleBob.TheBowlingGameKata


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
                self.total = 10 + self.spare_bonus(frame_idx)
                frame_idx += 2
            else:
                self.total += self.sum_of_balls_in_frame(frame_idx)
                frame_idx += 2
        return self.total
