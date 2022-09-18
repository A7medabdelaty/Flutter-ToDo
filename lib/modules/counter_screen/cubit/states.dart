abstract class CounterStates{}

class CounterInitState extends CounterStates{}

class CounterPlusState extends CounterStates{
  int counter;
  CounterPlusState(this.counter);
}

class CounterMinusState extends CounterStates{
  int counter;
  CounterMinusState(this.counter);
}
