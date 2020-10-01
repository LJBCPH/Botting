//+------------------------------------------------------------------+
//|                                                    FirstTest.mq5 |
//|                        Copyright 2020, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#define SELECT_BY_TICKET 1
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
//---
   
//---
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
//void OnDeinit(const int reason)
 // {
//---
   
  //}
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
  {
//---
   MqlTick LastPrice;
   SymbolInfoTick(Symbol() ,LastPrice);
   double CurP,LasP,stoploss,takeprofit,minstoplevel;
   int order;
   double point=SymbolInfoDouble(_Symbol,SYMBOL_POINT);
   double bid=SymbolInfoDouble(_Symbol,SYMBOL_BID); 
   double CurrentClose, PreviousClose1, PreviousClose2;
   double Open[];
   int count;   // number of elements to copy
   ArraySetAsSeries(Open,true);
   CopyOpen(_Symbol,_Period,0,count,Open);
   CurP = Open[0]; // current bar close.
   //CurP = iClose(_Symbol,0,0);
   LasP = Open[1];
   //minstoplevel=MarketInfo(Symbol(),MODE_STOPLEVEL);
   stoploss=NormalizeDouble(bid-point*Point()+30.0,6);
   takeprofit=NormalizeDouble(bid+point*Point()-90.0,6);
   if(CurP < LasP){
         if(OrdersTotal() <= 0){
            order = 0;
         }
         if (OrderSelect(order) && OrderType() == OP_BUY){
               if(OrderClose(OrderTicket(),OrderLots(),MarketInfo(OrderSymbol(),MODE_BID),5,Red)) {
                  //OrderClose(OrderTicket(),OrderLots(),MarketInfo(OrderSymbol(),MODE_BID),5,Red);
                  order = 0;  
                  //OrderClose(OrderTicket(),OrderLots(),Ask,1000,clrPink)
               }
      Alert("BOUGHT SHORT");
   }
  }
 }
//+------------------------------------------------------------------+
//| Trade function                                                   |
//+------------------------------------------------------------------+

