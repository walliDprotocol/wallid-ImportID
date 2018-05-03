/* ****************************************************************************

 * eID Middleware Project.
 * Copyright (C) 2008-2009 FedICT.
 *
 * This is free software; you can redistribute it and/or modify it
 * under the terms of the GNU Lesser General Public License version
 * 3.0 as published by the Free Software Foundation.
 *
 * This software is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this software; if not, see
 * http://www.gnu.org/licenses/.

**************************************************************************** */


#ifndef _SETTINGS_H_
#define _SETTINGS_H_

#include <Qt>
#include <QtCore>
#include <QSettings>
#include <QString>
#include "eidlib.h"

#define STR_DEF_GUILANGUAGE		"en"

class GUISettings
{
public:
    //------------------------------------------------------
    // ctor
    //------------------------------------------------------
    GUISettings( void )
        :m_test_mode(false)
        , m_GuiLanguage("en")
        , m_bNotShowStartUpHelp(false)
        , m_strExePath("")
    {
        //----------------------------------------------------------
        // Check always what is set in the registry
        //----------------------------------------------------------
        //----------------------------------------------------------
        // check the GUI language
        //----------------------------------------------------------
        {
            eIDMW::PTEID_Config config(eIDMW::PTEID_PARAM_GENERAL_LANGUAGE);
            QString lng = config.getString();

            if(lng == "en" || lng == "pt"){
                setGuiLanguage(lng);
            }else{
                setGuiLanguage(STR_DEF_GUILANGUAGE);
            }
        }
        //----------------------------------------------------------
        // check ShowHelpStartUp
        //----------------------------------------------------------
        {
            eIDMW::PTEID_Config config(eIDMW::PTEID_PARAM_GUITOOL_SHOWSTARTUPHELP);
            long ShowHelpStartUp = config.getLong();
            if ( 0 != ShowHelpStartUp )
            {
                setNotShowHelpStartUp(true);
            }
        }
    }
    //------------------------------------------------------
    // dtor
    //------------------------------------------------------
    ~GUISettings( void )
    {
    }
    //------------------------------------------------------
    // Read the setting
    //------------------------------------------------------
    QString const& getGuiLanguageString( void ) const
    {
        return m_GuiLanguage;
    }
    void setGuiLanguage( QString const& GuiLanguage=STR_DEF_GUILANGUAGE )
    {
        m_GuiLanguage = GuiLanguage;
    }
    void setLanguage( QString const& language )
    {
        m_GuiLanguage = language;
        eIDMW::PTEID_Config config(eIDMW::PTEID_PARAM_GENERAL_LANGUAGE);
        config.setString(m_GuiLanguage.toLatin1());
    }
    bool getNotShowHelpStartUp( void )
    {
        return m_bNotShowStartUpHelp;
    }
    void setNotShowHelpStartUp(  bool bNotShowStartUpHelp )
    {
        m_bNotShowStartUpHelp = bNotShowStartUpHelp;
        eIDMW::PTEID_Config config(eIDMW::PTEID_PARAM_GUITOOL_SHOWSTARTUPHELP);
        config.setLong(m_bNotShowStartUpHelp);
    }
    void setExePath( QString const& strExePath )
    {
        m_strExePath = strExePath;
    }

    QString const& getExePath( void )
    {
        return m_strExePath;
    }

    void setGuiVersion( QString const& GUIVersion )
    {
        m_GUIVersion = GUIVersion;
    }
    QString const& getGuiVersion( void )
    {
        return m_GUIVersion;
    }
    bool getTestMode()
    {
        return m_test_mode;
    }
    void setTestMode( bool test_mode )
    {
        m_test_mode = test_mode;
    }

private:
    bool m_test_mode;

    QString m_GuiLanguage;
    bool    m_bNotShowStartUpHelp;
    QString m_strExePath;

    QString m_GUIVersion;
};

#endif // SETTINGS_H
