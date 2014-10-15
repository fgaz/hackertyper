import System.IO
import System.Environment
import Paths_hackertyper
main = do
    args <- getArgs
    let n = if null args then 3 else read (args !! 0) :: Int
    hSetBuffering stdout NoBuffering
    hSetBuffering stdin NoBuffering
    hSetEcho stdin False
    kernelPath <- getDataFileName "kernel.txt"
    kernel <- readFile kernelPath
    putStr "\ESC[2J" --clear the screen
    typer n $ concat $ repeat kernel

typer n str = do
    getChar
    putStr $ take n str
    typer n $ drop n str