package main

import (
	"bufio"
	"fmt"
	"io"
	"os"
	"strconv"
	"strings"
)

/*
 * Complete the 'timeConversion' function below.
 *
 * The function is expected to return a STRING.
 * The function accepts STRING s as parameter.
 */

func timeConversion(s string) string {
	dnDeli := s[8:10]
	time, minute, second := s[0:2], s[3:5], s[6:8]

	timeNum, _ := strconv.ParseInt(time, 10, 32)

	if dnDeli == "PM" {
		if time != "12" {
			time = fmt.Sprintf("%2d", timeNum+12)
		}
	} else {
		if time == "12" {
			time = "00"
		}
	}

	return fmt.Sprintf("%s:%s:%s", time, minute, second)
}

func main() {
	reader := bufio.NewReaderSize(os.Stdin, 16*1024*1024)

	stdout, err := os.Create(os.Getenv("OUTPUT_PATH"))
	checkError(err)

	defer stdout.Close()

	writer := bufio.NewWriterSize(stdout, 16*1024*1024)

	s := readLine(reader)

	result := timeConversion(s)

	fmt.Fprintf(writer, "%s\n", result)

	writer.Flush()
}

func readLine(reader *bufio.Reader) string {
	str, _, err := reader.ReadLine()
	if err == io.EOF {
		return ""
	}

	return strings.TrimRight(string(str), "\r\n")
}

func checkError(err error) {
	if err != nil {
		panic(err)
	}
}
