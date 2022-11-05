unit uCall;

interface

type
  TCall<T> = reference to procedure (Call: T);

  TCallF<T> = reference to function (Entity: T): Boolean;

  TKall<T> = reference to function (Id: Integer): Boolean;

  TCallOne<T> = reference to function (Id: Integer): T;

  TSession = (tsWrite, tsRead);

implementation

end.
