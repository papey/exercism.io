<?php


class Tournament
{
    const TABLE_HEADER = "Team                           | MP |  W |  D |  L |  P";

    public function tally($scores)
    {
        $raw_results = preg_split("/(\r\n|\n|\r)/", $scores);
        $results = array_reduce($raw_results, array($this, 'parse_result'), array());
        usort($results, function ($a, $b) {
            if ($a->p == $b->p) {
                return $a->name < $b->name ? -1 : 1;
            }

            return $a->p < $b->p ? 1 : -1;
        });
        return array_reduce($results, function ($acc, $result) {
            return $acc . "\n" . $result->pp();
        }, Tournament::TABLE_HEADER);
    }

    private function parse_result($teams, $result)
    {
        trim($result);
        if ($result == "") {
            return $teams;
        }

        $parts = explode(";", $result);
        $t1_name = $parts[0];
        $t2_name = $parts[1];
        $outcome = $parts[2];

        $t1 = $teams[$t1_name] ?? new TeamResult($t1_name);
        $t2 = $teams[$t2_name] ?? new TeamResult($t2_name);

        switch ($outcome) {
            case 'win':
                $t1->add_win();
                $t2->add_loss();
                break;

            case 'loss':
                $t1->add_loss();
                $t2->add_win();
                break;

            default:
                $t1->add_draw();
                $t2->add_draw();
        }

        $teams[$t1->name] = $t1;
        $teams[$t2->name] = $t2;

        return $teams;
    }
}

class TeamResult
{

    public function __construct($name)
    {
        $this->name = $name;
        $this->mp = 0;
        $this->w = 0;
        $this->d = 0;
        $this->l = 0;
        $this->p = 0;
    }

    public function pp()
    {
        $padded_name = str_pad($this->name, 31);
        return "{$padded_name}|  {$this->mp} |  {$this->w} |  {$this->d} |  {$this->l} |  {$this->p}";
    }

    public function add_win()
    {
        $this->mp++;
        $this->w++;
        $this->p += 3;
    }

    public function add_loss()
    {
        $this->mp++;
        $this->l++;
    }

    public function add_draw()
    {
        $this->mp++;
        $this->d++;
        $this->p++;
    }
}
