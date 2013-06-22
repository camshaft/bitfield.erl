bitfield.erl [![Build Status](https://travis-ci.org/CamShaft/bitfield.erl.png)](https://travis-ci.org/CamShaft/bitfield.erl)
============

Simple bitfields for erlang

Usage
-----

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

Tests
-----

```sh
$ make test
```
