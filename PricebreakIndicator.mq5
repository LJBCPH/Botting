void OnInit(){
   // Constant variables should be defined here.
   //SetIndexBuffer(1, fstHighestCandle, INDICATOR_DATA);
   // PlotIndexSetInteger(1, PLOT_ARROW, 159);

}

void OnTick(){

   int fstHighestCandle = iHighest(_Symbol, _Period, MODE_HIGH, 9, 0);
   int sndHighestCandle = iHighest(_Symbol, _Period, MODE_HIGH, 19, 10);
   int trdHighestCandle = iHighest(_Symbol, _Period, MODE_HIGH, 30, 20);
   
   int fstLowCandle = iLowest(_Symbol, _Period, MODE_HIGH, 10, 0);
   int sndLowCandle = iLowest(_Symbol, _Period, MODE_HIGH, 10, 10);
   int trdLowCandle = iLowest(_Symbol, _Period, MODE_HIGH, 10, 20);
   
   ObjectCreate(
                  0,
                  "Test",
                  OBJ_TREND,
                  0,
                  fstHighestCandle,
                  iHigh(_Symbol, _Period, fstHighestCandle),
                  sndHighestCandle,
                  iHigh(_Symbol, _Period, sndHighestCandle)
               );
   
   ObjectSetInteger(0, "Test", OBJPROP_COLOR, 5);
   ObjectSetInteger(0, "Test", OBJPROP_STYLE, 5);
   ObjectSetInteger(0, "Test", OBJPROP_WIDTH, 5);
   ObjectSetInteger(0, "Test", OBJPROP_RAY, 5);
   
   
   //Print("first Highest candle is: ", fstHighestCandle);
   //Print("second Highest candle is: ", sndHighestCandle);
   //Print("third Highest candle is: ", trdHighestCandle);
   
   
}