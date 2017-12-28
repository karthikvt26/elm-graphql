module Github.Object.UnknownSignature exposing (..)

import Github.Enum.GitSignatureState
import Github.Object
import Graphqelm.Builder.Argument as Argument exposing (Argument)
import Graphqelm.Builder.Object as Object
import Graphqelm.Encode as Encode exposing (Value)
import Graphqelm.FieldDecoder as FieldDecoder exposing (FieldDecoder)
import Graphqelm.OptionalArgument exposing (OptionalArgument(Absent))
import Graphqelm.SelectionSet exposing (SelectionSet)
import Json.Decode as Decode


selection : (a -> constructor) -> SelectionSet (a -> constructor) Github.Object.UnknownSignature
selection constructor =
    Object.object constructor


email : FieldDecoder String Github.Object.UnknownSignature
email =
    Object.fieldDecoder "email" [] Decode.string


isValid : FieldDecoder Bool Github.Object.UnknownSignature
isValid =
    Object.fieldDecoder "isValid" [] Decode.bool


payload : FieldDecoder String Github.Object.UnknownSignature
payload =
    Object.fieldDecoder "payload" [] Decode.string


signature : FieldDecoder String Github.Object.UnknownSignature
signature =
    Object.fieldDecoder "signature" [] Decode.string


signer : SelectionSet signer Github.Object.User -> FieldDecoder signer Github.Object.UnknownSignature
signer object =
    Object.single "signer" [] object


state : FieldDecoder Github.Enum.GitSignatureState.GitSignatureState Github.Object.UnknownSignature
state =
    Object.fieldDecoder "state" [] Github.Enum.GitSignatureState.decoder