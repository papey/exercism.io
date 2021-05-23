// The code below is a stub. Just enough to satisfy the compiler.
// In order to pass the tests you can add-to or change any of this code.

#[derive(Debug)]
pub struct Duration(f64);

const SEC_IN_YEAR: u32 = 31557600;

impl From<u64> for Duration {
    fn from(s: u64) -> Self {
        Duration(s as f64 / SEC_IN_YEAR as f64)
    }
}

pub trait Planet {
    fn ratio() -> f64;
    fn years_during(d: &Duration) -> f64 {
        d.0 / Self::ratio()
    }
}

macro_rules! space_age {
    ($p:ident, $r:expr) => {
        pub struct $p;
        impl Planet for $p {
            fn ratio() -> f64 {
                $r
            }
        }
    };
}

space_age!(Earth, 1.0);
space_age!(Mercury, 0.2408467);
space_age!(Venus, 0.61519726);
space_age!(Mars, 1.8808158);
space_age!(Jupiter, 11.862615);
space_age!(Saturn, 29.447498);
space_age!(Uranus, 84.016846);
space_age!(Neptune, 164.79132);
