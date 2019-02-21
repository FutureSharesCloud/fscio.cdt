#include <hello.hpp>
ACTION hello::hi( name nm ) {
   print_f("Name : %\n", nm);
}

ACTION hello::check( name nm ) {
   print_f("Name : %\n", nm);
   fscio::check(nm == "hello"_n, "check name not equal to `hello`");
}

FSCIO_DISPATCH( hello, (hi)(check) )
