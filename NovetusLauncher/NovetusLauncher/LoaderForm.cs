﻿/*
 * Created by SharpDevelop.
 * User: BITL
 * Date: 6/13/2017
 * Time: 11:45 AM
 * 
 * To change this template use Tools | Options | Coding | Edit Standard Headers.
 */
using System;
using System.IO;
using System.Diagnostics;
using System.Threading;
using System.Drawing;
using System.Windows.Forms;
using System.Reflection;
using System.Security.Cryptography;
using System.Text;
using System.Text.RegularExpressions;

namespace NovetusLauncher
{
	/// <summary>
	/// Description of LoaderForm.
	/// </summary>
	public partial class LoaderForm : Form
	{
		public LoaderForm()
		{
			//
			// The InitializeComponent() call is required for Windows Forms designer support.
			//
			InitializeComponent();
			
			//
			// TODO: Add constructor code after the InitializeComponent() call.
			//
		}
		
		void LoaderFormLoad(object sender, EventArgs e)
		{
			string[] lines = File.ReadAllLines(Path.GetDirectoryName(Assembly.GetExecutingAssembly().Location) + "\\info.txt");
    		GlobalVars.DefaultClient = lines[1];
    		GlobalVars.DefaultMap = lines[2];
    		GlobalVars.SelectedClient = GlobalVars.DefaultClient;
    		GlobalVars.Map = GlobalVars.DefaultMap;
			QuickConfigure main = new QuickConfigure();
			main.ShowDialog();
			System.Threading.Timer timer = new System.Threading.Timer(new TimerCallback(CheckIfFinished), null, 1, 0);			
		}
		
		void StartGame()
		{
			string ExtractedArg = GlobalVars.SharedArgs.Replace("novetus://", "").Replace("novetus", "").Replace(":", "").Replace("/", "").Replace("?", "");
			string ConvertedArg = SecurityFuncs.Base64Decode(ExtractedArg);
			string[] SplitArg = ConvertedArg.Split('|');
			string ip = SecurityFuncs.Base64Decode(SplitArg[0]);
			string port = SecurityFuncs.Base64Decode(SplitArg[1]);
			string client = SecurityFuncs.Base64Decode(SplitArg[2]);
			ReadClientValues(client);
			string luafile = "";
			if (!GlobalVars.FixScriptMapMode)
			{
				luafile = "rbxasset://scripts\\\\" + GlobalVars.ScriptName + ".lua";
			}
			else
			{
				luafile = GlobalVars.ClientDir + @"\\" + GlobalVars.SelectedClient + @"\\content\\scripts\\" + GlobalVars.ScriptGenName + ".lua";
			}
			string rbxexe = "";
			if (GlobalVars.LegacyMode == true)
			{
				rbxexe = Path.GetDirectoryName(Assembly.GetExecutingAssembly().Location) +  "\\clients\\" + client + @"\\RobloxApp.exe";
			}
			else
			{
				rbxexe = Path.GetDirectoryName(Assembly.GetExecutingAssembly().Location) +  "\\clients\\" + client + @"\\RobloxApp_client.exe";
			}
			string quote = "\"";
			string args = "";
			if (!GlobalVars.FixScriptMapMode)
			{
				args = "-script " + quote + "dofile('" + luafile + "'); " + ScriptGenerator.GetScriptFuncForType(ScriptGenerator.ScriptType.Client, client) + quote;
			}
			else
			{
				ScriptGenerator.GenerateScriptForClient(ScriptGenerator.ScriptType.Client, client);
				args = "-script " + quote + luafile + quote;
			}
			try
			{
				if (!GlobalVars.AlreadyHasSecurity)
				{
					if (SecurityFuncs.checkClientMD5(client) == true)
					{
						if (SecurityFuncs.checkScriptMD5(client) == true)
						{
							Process.Start(rbxexe, args);
							this.Close();
						}
						else
						{
							label1.Text = "The client has been detected as modified.";
						}
					}
					else
					{
						label1.Text = "The client has been detected as modified.";
					}
				}
				else
				{
					Process.Start(rbxexe, args);
					this.Close();
				}
			}
			catch (Exception)
			{
				label1.Text = "The client has been detected as modified.";
			}
		}
		
		private void CheckIfFinished(object state)
    	{
			if (GlobalVars.ReadyToLaunch == false)
			{
				System.Threading.Timer timer = new System.Threading.Timer(new TimerCallback(CheckIfFinished), null, 1, 0);
			}
			else
			{
				label1.Text = "Launching Game...";
				StartGame();
			}
    	}
		
		void ReadConfigValues()
		{
			LauncherFuncs.ReadConfigValues(GlobalVars.BasePath + "\\config.txt");
		}
		
		void ReadClientValues(string ClientName)
		{
			string clientpath = Path.GetDirectoryName(Assembly.GetExecutingAssembly().Location) +  "\\clients\\" + ClientName + "\\clientinfo.txt";
			
			if (!File.Exists(clientpath))
			{
				MessageBox.Show("No clientinfo.txt detected with the client you chose. The client either cannot be loaded, or it is not available.","Novetus Launcher - Error while loading client", MessageBoxButtons.OK, MessageBoxIcon.Error);
				GlobalVars.SelectedClient = GlobalVars.DefaultClient;
			}
			
			LauncherFuncs.ReadClientValues(clientpath);
		}
	}
}
