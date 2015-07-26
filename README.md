bitfield [![Build Status](https://travis-ci.org/camshaft/bitfield.erl.png)](https://travis-ci.org/camshaft/bitfield.erl)
========

Simple bitfields for erlang/elixir

Usage
-----

### Erlang

```erlang
%% Create a list of fields
Enum = [<<"name">>, <<"age">>, <<"email">>, <<"address">>, <<"friends">>].

%% Fields to be enabled
Enabled = [<<"name">>, <<"address">>].

Packed = bitfield:pack(Enabled, Enum).
%% => <<144>>

Unpacked = bitfield:unpack(Packed, Enum).
%% => [<<"name">>, <<"address">>]
```

### Elixir

```elixir
## Create a list of fields
enum = ["name", "age", "email", "address", "friends"].

## Fields to be enabled
enabled = ["name", "address"].

packed = Bitfield.pack(enabled, enum).
## => <<144>>

unpacked = Bitfield.unpack(packed, enum).
## => ["name", "address"]
```

Tests
-----

```sh
$ mix test
```
