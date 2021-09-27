use std::cmp::min;

pub struct Player {
    pub health: u32,
    pub mana: Option<u32>,
    pub level: u32,
}

impl Player {
    pub fn new(level: u32) -> Player {
        Player {
            health: 100,
            mana: if level >= 10 { Some(100) } else { None },
            level: level,
        }
    }

    pub fn revive(&self) -> Option<Player> {
        if self.health != 0 {
            return None;
        }

        Some(Player::new(self.level))
    }

    pub fn cast_spell(&mut self, mana_cost: u32) -> u32 {
        match self.mana {
            Some(mana) => {
                if mana < mana_cost {
                    return 0;
                }
                self.mana = Some(mana - mana_cost);
                return mana_cost * 2;
            }
            None => {
                self.health -= min(self.health, mana_cost);
                0
            }
        }
    }
}
