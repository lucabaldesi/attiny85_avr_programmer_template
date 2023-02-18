#include <avr/io.h>
#include <util/delay.h>

int main(void)
{
    DDRB = _BV(DDB0); // PB0 as output
    while(1)
    {
        PORTB |= _BV(PORTB0); // set PB0 high
        _delay_ms(2000);// 2 seconds
        PORTB = 0x00;// set PB low
        _delay_ms(1000);
    }
}
