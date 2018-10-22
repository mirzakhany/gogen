package commands

import (
	"github.com/spf13/cobra"
	"fmt"
)

var initCmd = &cobra.Command{
	Use:   "init",
	Short: "Generate project",
	Long:  `Generate project and directories`,
	Run:   initCmdFunc,
}

func initCmdFunc(cmd *cobra.Command, args []string) {

	fmt.Println("hi this is init")

}

func init() {
	rootCmd.AddCommand(initCmd)
}