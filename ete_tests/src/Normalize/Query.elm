-- Do not manually edit this file, it was auto-generated by dillonkearns/elm-graphql
-- https://github.com/dillonkearns/elm-graphql


module Normalize.Query exposing (CircularInputRequiredArguments, DroidRequiredArguments, GreetRequiredArguments, HeroOptionalArguments, HeroUnionOptionalArguments, HumanRequiredArguments, RecursiveInputRequiredArguments, TypeOptionalArguments, circularInput, conflictingTypesUnion, droid_, greet, hero, heroUnion, human, recursiveInput, type_)

import Graphql.Internal.Builder.Argument as Argument exposing (Argument)
import Graphql.Internal.Builder.Object as Object
import Graphql.Internal.Encode as Encode exposing (Value)
import Graphql.Operation exposing (RootMutation, RootQuery, RootSubscription)
import Graphql.OptionalArgument exposing (OptionalArgument(..))
import Graphql.SelectionSet exposing (SelectionSet)
import Json.Decode as Decode exposing (Decoder)
import Normalize.Enum.Episode_
import Normalize.InputObject
import Normalize.Interface
import Normalize.Object
import Normalize.Scalar
import Normalize.ScalarCodecs
import Normalize.Union


type alias CircularInputRequiredArguments =
    { input : Normalize.InputObject.CircularOne }


{-|

  - input - Test circular input.

-}
circularInput : CircularInputRequiredArguments -> SelectionSet (Maybe String) RootQuery
circularInput requiredArgs =
    Object.selectionForField "(Maybe String)" "circularInput" [ Argument.required "input" requiredArgs.input Normalize.InputObject.encodeCircularOne ] (Decode.string |> Decode.nullable)


conflictingTypesUnion : SelectionSet decodesTo Normalize.Union.ConflictingTypesUnion -> SelectionSet decodesTo RootQuery
conflictingTypesUnion object_ =
    Object.selectionForCompositeField "conflictingTypesUnion" [] object_ identity


type alias DroidRequiredArguments =
    { iD_ : Normalize.ScalarCodecs.Id }


{-|

  - iD\_ - ID of the droid.

-}
droid_ : DroidRequiredArguments -> SelectionSet decodesTo Normalize.Object.Droid -> SelectionSet (Maybe decodesTo) RootQuery
droid_ requiredArgs object_ =
    Object.selectionForCompositeField "_droid" [ Argument.required "_iD" requiredArgs.iD_ (Normalize.ScalarCodecs.codecs |> Normalize.Scalar.unwrapEncoder .codecId) ] object_ (identity >> Decode.nullable)


type alias GreetRequiredArguments =
    { input : Normalize.InputObject.Greeting }


greet : GreetRequiredArguments -> SelectionSet String RootQuery
greet requiredArgs =
    Object.selectionForField "String" "greet" [ Argument.required "input" requiredArgs.input Normalize.InputObject.encodeGreeting ] Decode.string


type alias HeroOptionalArguments =
    { episode : OptionalArgument Normalize.Enum.Episode_.Episode_ }


{-|

  - episode - If omitted, returns the hero of the whole saga. If provided, returns the hero of that particular episode.

-}
hero : (HeroOptionalArguments -> HeroOptionalArguments) -> SelectionSet decodesTo Normalize.Interface.Character -> SelectionSet decodesTo RootQuery
hero fillInOptionals object_ =
    let
        filledInOptionals =
            fillInOptionals { episode = Absent }

        optionalArgs =
            [ Argument.optional "episode" filledInOptionals.episode (Encode.enum Normalize.Enum.Episode_.toString) ]
                |> List.filterMap identity
    in
    Object.selectionForCompositeField "hero" optionalArgs object_ identity


type alias HeroUnionOptionalArguments =
    { episode : OptionalArgument Normalize.Enum.Episode_.Episode_ }


{-|

  - episode - If omitted, returns the hero of the whole saga. If provided, returns the hero of that particular episode.

-}
heroUnion : (HeroUnionOptionalArguments -> HeroUnionOptionalArguments) -> SelectionSet decodesTo Normalize.Union.CharacterUnion -> SelectionSet (Maybe decodesTo) RootQuery
heroUnion fillInOptionals object_ =
    let
        filledInOptionals =
            fillInOptionals { episode = Absent }

        optionalArgs =
            [ Argument.optional "episode" filledInOptionals.episode (Encode.enum Normalize.Enum.Episode_.toString) ]
                |> List.filterMap identity
    in
    Object.selectionForCompositeField "heroUnion" optionalArgs object_ (identity >> Decode.nullable)


type alias HumanRequiredArguments =
    { id : Normalize.ScalarCodecs.Id }


{-|

  - id - ID of the human.

-}
human : HumanRequiredArguments -> SelectionSet decodesTo Normalize.Object.Human_ -> SelectionSet (Maybe decodesTo) RootQuery
human requiredArgs object_ =
    Object.selectionForCompositeField "human" [ Argument.required "id" requiredArgs.id (Normalize.ScalarCodecs.codecs |> Normalize.Scalar.unwrapEncoder .codecId) ] object_ (identity >> Decode.nullable)


type alias RecursiveInputRequiredArguments =
    { input : Normalize.InputObject.Recursive }


{-|

  - input - Test recursive input.

-}
recursiveInput : RecursiveInputRequiredArguments -> SelectionSet (Maybe String) RootQuery
recursiveInput requiredArgs =
    Object.selectionForField "(Maybe String)" "recursiveInput" [ Argument.required "input" requiredArgs.input Normalize.InputObject.encodeRecursive ] (Decode.string |> Decode.nullable)


type alias TypeOptionalArguments =
    { input : OptionalArgument Normalize.InputObject.ReservedWord }


type_ : (TypeOptionalArguments -> TypeOptionalArguments) -> SelectionSet String RootQuery
type_ fillInOptionals =
    let
        filledInOptionals =
            fillInOptionals { input = Absent }

        optionalArgs =
            [ Argument.optional "input" filledInOptionals.input Normalize.InputObject.encodeReservedWord ]
                |> List.filterMap identity
    in
    Object.selectionForField "String" "type" optionalArgs Decode.string
