using ReactNative.Bridge;
using System;
using System.Collections.Generic;
using Windows.ApplicationModel.Core;
using Windows.UI.Core;

namespace Workmates.Gift.Exchanging.RNWorkmatesGiftExchanging
{
    /// <summary>
    /// A module that allows JS to share data.
    /// </summary>
    class RNWorkmatesGiftExchangingModule : NativeModuleBase
    {
        /// <summary>
        /// Instantiates the <see cref="RNWorkmatesGiftExchangingModule"/>.
        /// </summary>
        internal RNWorkmatesGiftExchangingModule()
        {

        }

        /// <summary>
        /// The name of the native module.
        /// </summary>
        public override string Name
        {
            get
            {
                return "RNWorkmatesGiftExchanging";
            }
        }
    }
}
