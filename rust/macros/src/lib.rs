#[macro_export]
macro_rules! hashmap {
    () => {
        ::std::collections::HashMap::new()
    };
    ( $( $key:expr => $value:expr ),+ $(,)? ) => {
       {
            let mut hmap = ::std::collections::HashMap::new();
            $(hmap.insert($key, $value);)*
            hmap
       }
    };
}
