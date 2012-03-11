using System;
using System.IO;
using System.Runtime.InteropServices;
using System.Security.Permissions;
using Microsoft.SharePoint;
using Microsoft.SharePoint.Security;
using System.Collections;

namespace AmbArt.Common.Features.AmbArt.Common.SiteCollection
{
    /// <summary>
    /// Questa classe gestisce gli eventi generati durante l'attivazione, la disattivazione, l'installazione, la disinstallazione e l'aggiornamento della funzionalità.
    /// </summary>
    /// <remarks>
    /// Il GUID associato alla classe potrebbe essere utilizzato durante la creazione del pacchetto e non deve essere modificato.
    /// </remarks>

    [Guid("c079d3ab-d7e1-4d8d-8cd7-65a92499c379")]
    public class AmbArtCommonEventReceiver : SPFeatureReceiver
    {
        // Rimuovere il commento dal metodo seguente per gestire l'evento generato dopo l'attivazione di una funzionalità.

        //public override void FeatureActivated(SPFeatureReceiverProperties properties)
        //{
        //}
        public override void FeatureActivated(SPFeatureReceiverProperties properties)
        {
            SPSite site = properties.Feature.Parent as SPSite;
            UpdateMasterpageGallery(properties, site.RootWeb);
        }

        private static void UpdateMasterpageGallery(SPFeatureReceiverProperties properties, SPWeb web)
        {
            ArrayList arrlstMasterpageFilesToOverwrite = new ArrayList();
            foreach (SPFeatureProperty p in properties.Feature.Properties)
            {
                if (p.Name.StartsWith("overwritemasterpagefile"))
                {
                    arrlstMasterpageFilesToOverwrite.Add(p.Value);
                }
            }
            using (web)
            {
                for (int i = 0; i < arrlstMasterpageFilesToOverwrite.Count; i++)
                {
                    //SPFile fileMasterpage = web.Lists["Master Page Gallery"].RootFolder.Files["woodgroup_site.master"];
                    string strFileName = arrlstMasterpageFilesToOverwrite[i].ToString();
                    string strFileNameWithoutExt = Path.GetFileNameWithoutExtension(strFileName);
                    string strFileExt = Path.GetExtension(strFileName);
                    try
                    {
                        SPFile fileMasterpage = web.GetFile("_catalogs/masterpage/" + strFileName);
                        if (fileMasterpage != null)
                        {
                            if (fileMasterpage.CheckOutType != SPFile.SPCheckOutType.None)
                            {
                                fileMasterpage.CheckIn("checked in by feature");
                            }
                            fileMasterpage.CheckOut();
                            //backup file will show up in Master Page/Page Layout dropdowns so either Hide them or dont make a backup
                            //fileMasterpage.CopyTo(web.Url + "/_catalogs/masterpage/" + strFileNameWithoutExt + "_" + DateTime.Now.ToString("ddMMyyyyhhmmss") + strFileExt);
                            string strPathNewMasterPage = properties.Definition.RootDirectory + "/MOMasterpages/" + strFileName;
                            if (File.Exists(strPathNewMasterPage))
                            {
                                byte[] fcontents = File.ReadAllBytes(strPathNewMasterPage);
                                web.Lists["Raccolta pagine master"].RootFolder.Files.Add(strFileName, fcontents, true);
                                fileMasterpage.Update();
                                fileMasterpage.CheckIn("checked in by feature");
                                fileMasterpage.Publish("successfully published by feature");
                                fileMasterpage.Approve("approved by site feature");
                            }
                        }
                    }
                    catch
                    {
                    }
                }
            }
        }

        // Rimuovere il commento dal metodo seguente per gestire l'evento generato prima della disattivazione di una funzionalità.

        //public override void FeatureDeactivating(SPFeatureReceiverProperties properties)
        //{
        //}


        // Rimuovere il commento dal metodo seguente per gestire l'evento generato dopo l'installazione di una funzionalità.

        //public override void FeatureInstalled(SPFeatureReceiverProperties properties)
        //{
        //}


        // Rimuovere il commento dal metodo seguente per gestire l'evento generato prima della disinstallazione di una funzionalità.

        //public override void FeatureUninstalling(SPFeatureReceiverProperties properties)
        //{
        //}

        // Rimuovere il commento dal metodo seguente per gestire l'evento generato al momento dell'aggiornamento di una funzionalità.

        //public override void FeatureUpgrading(SPFeatureReceiverProperties properties, string upgradeActionName, System.Collections.Generic.IDictionary<string, string> parameters)
        //{
        //}
    }
}
