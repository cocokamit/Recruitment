using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Color
/// </summary>
public class ColorCode
{
	public ColorCode()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public static string[] collection()
    {
        string[] color = { "#f56954", "#3c8dbc", "#f39c12", "#00a65a", "#00c0ef", "#dd4b39", "#d2d6de" };
        List<string> inputList = color.ToList();
        string[] output = new string[color.Length];
        Random randomizer = new Random();
        int i = 0;

        while (inputList.Count > 0)
        {
            int index = randomizer.Next(inputList.Count);
            output[i++] = inputList[index];
            inputList.RemoveAt(index);
        }

        return (output);
    }
}