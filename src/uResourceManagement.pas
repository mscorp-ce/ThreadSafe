unit uResourceManagement;

interface

uses
  System.SysUtils, System.Generics.Collections, uCall;

type
  TResourceManagement<T: class> = class
  private
    fMultiReadExclusiveWrite: TMultiReadExclusiveWriteSynchronizer;
    procedure Write(Entity: T; Call: TCall<T>); overload;
    procedure Write(Entity: T; Call: TCallF<T>); overload;
    procedure Write(Id: Integer; Call: TKall<T>); overload;
    procedure Write(Id: Integer; Call: TCallOne<T>); overload;

    procedure Read(Entity: T; Call: TCall<T>); overload;
    procedure Read(Entity: T; Call: TCallF<T>); overload;
    procedure Read(Id: Integer; Call: TKall<T>); overload;
    procedure Read(Id: Integer; Call: TCallOne<T>); overload;
  public
    procedure CriticalSession(Entity: T; Call: TCall<T>; Session: TSession); overload;
    procedure CriticalSession(Entity: T; Call: TCallF<T>; Session: TSession); overload;
    procedure CriticalSession(Id: Integer; Call: TKall<T>; Session: TSession); overload;
    procedure CriticalSession(Id: Integer; Call: TCallOne<T>; Session: TSession); overload;

    constructor Create; reintroduce;
    destructor Destroy; override;
  end;

implementation

{ TResourceManagement<T> }

constructor TResourceManagement<T>.Create;
begin
  inherited Create;

  fMultiReadExclusiveWrite := TMultiReadExclusiveWriteSynchronizer.Create;
end;

procedure TResourceManagement<T>.CriticalSession(Entity: T; Call: TCall<T>; Session: TSession);
begin
  case Session of
    tsWrite: Write(Entity, Call);
    tsRead: Read(Entity, Call);
  end;
end;

procedure TResourceManagement<T>.CriticalSession(Id: Integer; Call: TKall<T>; Session: TSession);
begin
  case Session of
    tsWrite: Write(Id, Call);
    tsRead: Read(Id, Call);
  end;
end;

procedure TResourceManagement<T>.CriticalSession(Entity: T; Call: TCallF<T>; Session: TSession);
begin
  case Session of
    tsWrite: Write(Entity, Call);
    tsRead: Read(Entity, Call);
  end;
end;

destructor TResourceManagement<T>.Destroy;
begin
  FreeAndNil(fMultiReadExclusiveWrite);

  inherited Destroy;
end;

procedure TResourceManagement<T>.Read(Entity: T; Call: TCall<T>);
begin
  fMultiReadExclusiveWrite.BeginRead();
  try
    Call(Entity);

  finally
    fMultiReadExclusiveWrite.EndRead();
  end;
end;

procedure TResourceManagement<T>.Read(Entity: T; Call: TCallF<T>);
begin
  fMultiReadExclusiveWrite.BeginRead();
  try
    Call(Entity);

  finally
    fMultiReadExclusiveWrite.EndRead();
  end;
end;

procedure TResourceManagement<T>.Read(Id: Integer; Call: TKall<T>);
begin
  fMultiReadExclusiveWrite.BeginRead();
  try
    Call(Id);

  finally
    fMultiReadExclusiveWrite.EndRead();
  end;
end;

procedure TResourceManagement<T>.Read(Id: Integer; Call: TCallOne<T>);
begin
  fMultiReadExclusiveWrite.BeginRead();
  try
    Call(Id);

  finally
    fMultiReadExclusiveWrite.EndRead();
  end;
end;

procedure TResourceManagement<T>.Write(Entity: T; Call: TCall<T>);
begin
  fMultiReadExclusiveWrite.BeginWrite();
  try
    Call(Entity);

  finally
    fMultiReadExclusiveWrite.EndWrite();
  end;
end;

procedure TResourceManagement<T>.Write(Entity: T; Call: TCallF<T>);
begin
  fMultiReadExclusiveWrite.BeginWrite();
  try
    Call(Entity);

  finally
    fMultiReadExclusiveWrite.EndWrite();
  end;
end;

procedure TResourceManagement<T>.Write(Id: Integer; Call: TKall<T>);
begin
  fMultiReadExclusiveWrite.BeginWrite();
  try
    Call(Id);

  finally
    fMultiReadExclusiveWrite.EndWrite();
  end;
end;

procedure TResourceManagement<T>.Write(Id: Integer; Call: TCallOne<T>);
begin
  fMultiReadExclusiveWrite.BeginWrite();
  try
    Call(Id);

  finally
    fMultiReadExclusiveWrite.EndWrite();
  end;
end;

procedure TResourceManagement<T>.CriticalSession(Id: Integer;
  Call: TCallOne<T>; Session: TSession);
begin
  case Session of
    tsWrite: Write(Id, Call);
    tsRead: Read(Id, Call);
  end;
end;

end.
