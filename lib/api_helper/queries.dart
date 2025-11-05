import 'package:graphql_flutter/graphql_flutter.dart';
//we don't specify the type because graphql already knows the field type from its schema
//client just requests data
//the response automatically follows those types
//you are requesting them and not declaring them
final  trendingSeriesQuery= gql(r'''
    query trendingSeriesQuery(){
    Page(page: 1, perPage: 10){
    media(sort:TRENDING_DESC, type: ANIME){
    id
    title{
    english
    romaji
    native
    userPreferred
    }
    coverImage{
    large
    }
    }
    }
    }
    ''');
final  popularSeriesQuery= gql(r'''
    query popularSeriesQuery(){
    Page(page: 1, perPage: 10){
    media(sort:POPULARITY_DESC, type: ANIME){
    id
    title{
    english
    }
    coverImage{
    large
    }
    }
    }
    }
    ''');

final  headingSeriesQuery= gql(r'''
    query headingSeriesQuery(){
    Page(page: 1, perPage: 10){
    media(sort:SCORE_DESC, type: ANIME){
    id
    title{
    english
    }
    coverImage{
    large
    }
    seasonYear
    genres
    }
    }
    }
    ''');

final  latestSeriesQuery= gql(r'''
    query headingSeriesQuery(){
    Page(page: 1, perPage: 10){
    media(
    sort: START_DATE_DESC, 
    type: ANIME){
    id
    title{
    english
    native
    userPreferred
    }
    coverImage{
    large
    medium
    }
    
    }
    }
    }
    ''');





