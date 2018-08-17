USE [master]
GO

IF EXISTS(select * from sys.databases where name='OnBoardDataBase')
DROP DATABASE OnBoardDataBase

/****** Object:  Database [OnBoardDataBase] ******/
CREATE DATABASE [OnBoardDataBase]
 ON  PRIMARY 
( NAME = N'OnBoardDataBase', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\OnBoardDataBase.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'OnBoardDataBase_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\OnBoardDataBase_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [OnBoardDataBase] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [OnBoardDataBase].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

USE [OnBoardDataBase]
GO