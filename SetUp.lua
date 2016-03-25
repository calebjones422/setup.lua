#!/usr/local/bin/lua

--Configuration
SetupDir = "/Users/caleb/Code/GithubRepos/setuplua/"
startCodeDirLua = 0
startCodeDirHTML = 0
startCodeDirJava = 0
HLibLua = 0
LFSLibLua = 0

-- from http://lua-cusers.org/wiki/SleepFunction
local clock = os.clock
function sleep(n)
   local t0 = clock() -- time since program/script started
   while clock() - t0 <= n do end
end
-- By Caleb Jones
function clear()
   os.execute("clear")
end

function ProBar(Title, Speed)
  clear()
  print(Title)
  print("0%                           100% ")
  sleep(Speed)
  clear()
  print(Title)
  print("0% #                         100% ")
  sleep(Speed)
  clear()
  print(Title)
  print("0% ##                        100% ")
  sleep(Speed)
  clear()
  print(Title)
  print("0% ###                       100% ")
  sleep(Speed)
  clear()
  print(Title)
  print("0% ####                      100% ")
  sleep(Speed)
  clear()
  print(Title)
  print("0% #####                     100% ")
  sleep(Speed)
  clear()
  print(Title)
  print("0% ######                    100% ")
  sleep(Speed)
  clear()
  print(Title)
  print("0% #######                   100% ")
  sleep(Speed)
  clear()
  print(Title)
  print("0% ########                  100% ")
  sleep(Speed)
  clear()
  print(Title)
  print("0% #########                 100% ")
  sleep(Speed)
  clear()
  print(Title)
  print("0% ##########                100% ")
  sleep(Speed)
  clear()
  print(Title)
  print("0% ###########               100% ")
  sleep(Speed)
  clear()
  print(Title)
  print("0% ############              100% ")
  sleep(Speed)
  clear()
  print(Title)
  print("0% #############             100% ")
  sleep(Speed)
  clear()
  print(Title)
  print("0% ##############            100% ")
  sleep(Speed)
  clear()
  print(Title)
  print("0% ###############           100% ")
  sleep(Speed)
  clear()
  print(Title)
  print("0% ################          100% ")
  sleep(Speed)
  clear()
  print(Title)
  print("0% #################         100% ")
  sleep(Speed)
  clear()
  print(Title)
  print("0% ##################        100% ")
  sleep(Speed)
  clear()
  print(Title)
  print("0% ###################       100% ")
  sleep(Speed)
  clear()
  print(Title)
  print("0% ####################      100% ")
  sleep(Speed)
  clear()
  print(Title)
  print("0% #####################     100% ")
  sleep(Speed)
  clear()
  print(Title)
  print("0% ######################    100% ")
  sleep(Speed)
  clear()
  print(Title)
  print("0% #######################   100% ")
  sleep(Speed)
  clear()
  print(Title)
  print("0% ########################  100% ")
  sleep(Speed)
  clear()
  print(Title)
  print("0% ######################### 100% ")
  sleep(Speed)
  clear()
end

function file_exists(file)
  local f = io.open(file, "rb")
  if f then f:close() end
  return f ~= nil
end

function readData(file)
  if not file_exists(file) then return {} end
  lines = {}
  for line in io.lines(file) do
    lines[#lines + 1] = line
  end
  return lines
end

function ConfigGet()
   configFile = SetupDir.."config.txt"
   config = readData(configFile)
   startCodeDirLua = config[1]
   startCodeDirHTML = config[2]
   startCodeDirShellScript = config[4]
   startCodeDirJava = config[3]
   HLibLua = config[5]
   LFSLibLua = config[6]
end

function LuaSelect()
 if HLibLua == "y" then
      LuaHeroSU()
   else
      if LFSLibLua == "y" then
         LuaLFSSU()
      else
         LuaSU()
      end
   end
end
function Select()
  clear()
  ConfigGet()
  io.write("Code Language: ")
  CL = io.read()
  if CL == "Lua" then
    io.write("Code File Name: ")
    codeDir = startCodeDirLua..io.read()..".lua"
    LuaSelect()
  else
    if CL == "HTML" then
      io.write("Code File Name: ")
      codeDir = startCodeDirHTML..io.read()..".html"
      HTMLSU()
    else
      if CL == "Java" then
        io.write("Code Project Name: ")
        codeDir = startCodeDirJava..io.read().."/"
        dir = "mkdir "..codeDir
        os.execute(dir)
        io.write("Code Class Name: ")
        JClass = io.read()
        JClassFile = codeDir..JClass..".java"
        JavaSU()
      else
        if CL == "ShellScript" then
          io.write("Code File Name: ")
          codeDir = startCodeDirShellScript..io.read()..".sh"
          SHSU()
        else
          if CL == "Exit" then
          else
            print()
            print("Invalid Language")
            sleep(1)
            Select()
          end
        end
      end
    end
  end
end

function SHSU()
  file = io.open(codeDir, "w")
  file:write("#!/bin/bash", "\n")
  ProBar("Setting Up ShellScript File"..codeDir, 0,17)
end

function JavaSU()
  file = io.open(JClassFile, "w")
  file:write("import java.util.Scanner;", "\n")
  file:write("class "..JClass.." {", "\n")
  file:write("public static void main(String[] args){", "\n", "\n")
  file:write("}", "\n")
  file:write("}", "\n", "\n")
  ProBar("Setting Up Java File "..JClassFile, 0.06)
end

function HTMLSU()
  file = io.open(codeDir, "w")
  file:write("<!DOCTYPE html>", "\n")
  file:write("<html>", "\n")
  file:write("<body>", "\n")
  file:write("<title></title>", "\n")
  file:write("</body>", "\n")
  file:write("</html>", "\n")
  ProBar("Setting Up HTML File "..codeDir, 0.06)
end

function LuaSU()
  file = io.open(codeDir, "w")
  file:write("#!/usr/local/bin/lua", "\n")
  ProBar("Setting Up Lua File "..codeDir, 0.06)
end

function LuaLFSSU()
  file = io.open(codeDir, "w")
  file:write("#!/usr/local/bin/lua", "\n")
  file:write("local lfs = require 'lfs'", "\n")
  ProBar("Setting Up Lua File "..codeDir, 0.06)
end

function LuaHeroSU()
  file = io.open(codeDir, "w")
  file:write("#!/usr/local/bin/lua", "\n")
  file:write("local lfs = require 'lfs'", "\n")
  file:write("local clock = os.clock", "\n")
  file:write("function sleep(n)", "\n")
  file:write("   local t0 = clock()", "\n")
  file:write("   while clock() - t0 <= n do end", "\n")
  file:write("end", "\n")
  file:write("function clear()", "\n")
  file:write("   os.execute('clear')", "\n")
  file:write("end", "\n")
  file:write("function ProBar(Title, Speed)", "\n")
  file:write("  clear()", "\n")
  file:write("  print(Title)", "\n")
  file:write("  print('0%                           100%')", "\n")
  file:write("  sleep(Speed)", "\n")
  file:write("  clear()", "\n")
  file:write("  print(Title)", "\n")
  file:write("  print('0% #                         100%')", "\n")
  file:write("  sleep(Speed)", "\n")
  file:write("  clear()", "\n")
  file:write("  print(Title)", "\n")
  file:write("  print('0% ##                        100%')", "\n")
  file:write("  sleep(Speed)", "\n")
  file:write("  clear()", "\n")
  file:write("  print(Title)", "\n")
  file:write("  print('0% ###                       100%')", "\n")
  file:write("  sleep(Speed)", "\n")
  file:write("  clear()", "\n")
  file:write("  print(Title)", "\n")
  file:write("  print('0% ####                      100%')", "\n")
  file:write("  sleep(Speed)", "\n")
  file:write("  clear()", "\n")
  file:write("  print(Title)", "\n")
  file:write("  print('0% #####                     100%')", "\n")
  file:write("  sleep(Speed)", "\n")
  file:write("  clear()", "\n")
  file:write("  print(Title)", "\n")
  file:write("  print('0% ######                    100%')", "\n")
  file:write("  sleep(Speed)", "\n")
  file:write("  clear()", "\n")
  file:write("  print(Title)", "\n")
  file:write("  print('0% #######                   100%')", "\n")
  file:write("  sleep(Speed)", "\n")
  file:write("  clear()", "\n")
  file:write("  print(Title)", "\n")
  file:write("  print('0% ########                  100%')", "\n")
  file:write("  sleep(Speed)", "\n")
  file:write("  clear()", "\n")
  file:write("  print(Title)", "\n")
  file:write("  print('0% #########                 100%')", "\n")
  file:write("  sleep(Speed)", "\n")
  file:write("  clear()", "\n")
  file:write("  print(Title)", "\n")
  file:write("  print('0% ##########                100%')", "\n")
  file:write("  sleep(Speed)", "\n")
  file:write("  clear()", "\n")
  file:write("  print(Title)", "\n")
  file:write("  print('0% ###########               100%')", "\n")
  file:write("  sleep(Speed)", "\n")
  file:write("  clear()", "\n")
  file:write("  print(Title)", "\n")
  file:write("  print('0% ############              100%')", "\n")
  file:write("  sleep(Speed)", "\n")
  file:write("  clear()", "\n")
  file:write("  print(Title)", "\n")
  file:write("  print('0% #############             100%')", "\n")
  file:write("  sleep(Speed)", "\n")
  file:write("  clear()", "\n")
  file:write("  print(Title)", "\n")
  file:write("  print('0% ##############            100%')", "\n")
  file:write("  sleep(Speed)", "\n")
  file:write("  clear()", "\n")
  file:write("  print(Title)", "\n")
  file:write("  print('0% ###############           100%')", "\n")
  file:write("  sleep(Speed)", "\n")
  file:write("  clear()", "\n")
  file:write("  print(Title)", "\n")
  file:write("  print('0% ################          100%')", "\n")
  file:write("  sleep(Speed)", "\n")
  file:write("  clear()", "\n")
  file:write("  print(Title)", "\n")
  file:write("  print('0% #################         100%')", "\n")
  file:write("  sleep(Speed)", "\n")
  file:write("  clear()", "\n")
  file:write("  print(Title)", "\n")
  file:write("  print('0% ##################        100%')", "\n")
  file:write("  sleep(Speed)", "\n")
  file:write("  clear()", "\n")
  file:write("  print(Title)", "\n")
  file:write("  print('0% ###################       100%')", "\n")
  file:write("  sleep(Speed)", "\n")
  file:write("  clear()", "\n")
  file:write("  print(Title)", "\n")
  file:write("  print('0% ####################      100%')", "\n")
  file:write("  sleep(Speed)", "\n")
  file:write("  clear()", "\n")
  file:write("  print(Title)", "\n")
  file:write("  print('0% #####################     100%')", "\n")
  file:write("  sleep(Speed)", "\n")
  file:write("  clear()", "\n")
  file:write("  print(Title)", "\n")
  file:write("  print('0% ######################    100%')", "\n")
  file:write("  sleep(Speed)", "\n")
  file:write("  clear()", "\n")
  file:write("  print(Title)", "\n")
  file:write("  print('0% #######################   100%')", "\n")
  file:write("  sleep(Speed)", "\n")
  file:write("  clear()", "\n")
  file:write("  print(Title)", "\n")
  file:write("  print('0% ########################  100%')", "\n")
  file:write("  sleep(Speed)", "\n")
  file:write("  clear()", "\n")
  file:write("  print(Title)", "\n")
  file:write("  print('0% ######################### 100%')", "\n")
  file:write("  sleep(Speed)", "\n")
  file:write("  clear()", "\n")
  file:write("end", "\n")
  file:write("function ls(root)", "\n")
  file:write("  for file in lfs.dir(root) do", "\n")
  file:write("		if file~='.' and file~='..' and file~='.DS_Store' then", "\n")
  file:write("			local fullPath=root..'/'..file", "\n")
  file:write("			local mode=lfs.attributes(fullPath,'mode')", "\n")
  file:write("			if mode=='file' then", "\n")
  file:write("				print(file)", "\n")
  file:write("      elseif mode=='directory' then", "\n")
  file:write("				ls(fullPath);", "\n")
  file:write("			end", "\n")
  file:write("		end", "\n")
  file:write("	end", "\n")
  file:write("end", "\n")
  file:write("function file_exists(file)", "\n")
  file:write("  local f = io.open(file, 'rb')", "\n")
  file:write("  if f then f:close() end", "\n")
  file:write("  return f ~= nil", "\n")
  file:write("end", "\n")
  file:write("function readData(file)", "\n")
  file:write("  if not file_exists(file) then return {} end", "\n")
  file:write("  lines = {}", "\n")
  file:write("  for line in io.lines(file) do", "\n")
  file:write("    lines[#lines + 1] = line", "\n")
  file:write("  end", "\n")
  file:write("  return lines", "\n")
  file:write("end", "\n")
  file:write("function ConfigGet()", "\n")
  file:write("   configFile = Dir/Where/Config/is..'config.txt'", "\n")
  file:write("   config = readData(configFile)", "\n")
  file:write("   varof1stconfigline = config[1]", "\n")
  file:write("end", "\n")
  ProBar("Setting Up Lua File "..codeDir, 0.17)
end

Select()
