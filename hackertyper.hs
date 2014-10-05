import System.IO
import System.Environment
main = do
    args <- getArgs
    let n = if null args then 3 else read (args !! 0) :: Int
    hSetBuffering stdout NoBuffering
    hSetBuffering stdin NoBuffering
    hSetEcho stdin False
    path <- getExecutablePath
    let path' = reverse $ dropWhile (/='/') $ reverse path --remove executable name from executable path
    kernel <- readFile $ path' ++ "kernel.txt"
    putStr "\ESC[2J" --clear the screen
    typer n $ concat $ repeat kernel

typer n str = do
    getChar
    putStr $ take n str
    typer n $ drop n str