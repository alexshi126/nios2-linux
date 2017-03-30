/*
 * Copyright (C) 2002, 2003, 2004, 2005, 2007 Free Software Foundation
 *
 * Author: Timo Schulz, Nikos Mavrogiannopoulos
 *
 * This file is part of GNUTLS-EXTRA.
 *
 * GNUTLS-EXTRA is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *               
 * GNUTLS-EXTRA is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *                               
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

/* Functions on OpenPGP key parsing
 */

#include <gnutls_int.h>
#include <gnutls_errors.h>
#include <gnutls_openpgp.h>
#include <gnutls_num.h>
#include <openpgp.h>
#include <x509/verify.h>	/* lib/x509/verify.h */


/**
 * gnutls_openpgp_crt_verify_ring - Verify all signatures in the key
 * @key: the structure that holds the key.
 * @keyring: holds the keyring to check against
 * @flags: unused (should be 0)
 * @verify: will hold the certificate verification output.
 *
 * Verify all signatures in the key, using the given set of keys (keyring). 
 *
 * The key verification output will be put in @verify and will be
 * one or more of the gnutls_certificate_status_t enumerated elements bitwise or'd.
 *
 * GNUTLS_CERT_INVALID: A signature on the key is invalid.
 *
 * GNUTLS_CERT_REVOKED: The key has been revoked.
 *
 * Note that this function does not verify using any "web of
 * trust". You may use GnuPG for that purpose, or any other external
 * PGP application.
 *
 * Returns 0 on success.
 **/
int
gnutls_openpgp_crt_verify_ring (gnutls_openpgp_crt_t key,
				gnutls_openpgp_keyring_t keyring,
				unsigned int flags, unsigned int *verify)
{
  opaque id[8];
  cdk_error_t rc;
  int status;

  if (!key || !keyring)
    {
      gnutls_assert ();
      return GNUTLS_E_NO_CERTIFICATE_FOUND;
    }

  *verify = 0;
  
  rc = cdk_pk_check_sigs (key->knode, keyring->db, &status);
  if (rc == CDK_Error_No_Key)
    {
      rc = GNUTLS_E_NO_CERTIFICATE_FOUND;
      gnutls_assert ();
      return rc;
    }
  else if (rc != CDK_Success)
    {
      _gnutls_x509_log("cdk_pk_check_sigs: error %d\n", rc);
      rc = _gnutls_map_cdk_rc (rc);
      gnutls_assert ();
      return rc;
    }
  _gnutls_x509_log("status: %x\n", status);

  if (status & CDK_KEY_INVALID)
    *verify |= GNUTLS_CERT_INVALID;
  if (status & CDK_KEY_REVOKED)
    *verify |= GNUTLS_CERT_REVOKED;
  if (status & CDK_KEY_NOSIGNER)
    *verify |= GNUTLS_CERT_SIGNER_NOT_FOUND;

  /* Check if the key is included in the ring. */
  if (!(flags & GNUTLS_VERIFY_DO_NOT_ALLOW_SAME))
    {
      rc = gnutls_openpgp_crt_get_id (key, id);
      if (rc < 0)
	{
	  gnutls_assert ();
	  return rc;
	}

      rc = gnutls_openpgp_keyring_check_id (keyring, id, 0);
      /* If it exists in the keyring don't treat it as unknown. */
      if (rc == 0 && *verify & GNUTLS_CERT_SIGNER_NOT_FOUND)
	*verify ^= GNUTLS_CERT_SIGNER_NOT_FOUND;
    }
  
  return 0;
}


/**
 * gnutls_openpgp_crt_verify_self - Verify the self signature on the key
 * @key: the structure that holds the key.
 * @flags: unused (should be 0)
 * @verify: will hold the key verification output.
 *
 * Verifies the self signature in the key.
 * The key verification output will be put in @verify and will be
 * one or more of the gnutls_certificate_status_t enumerated elements bitwise or'd.
 *
 * GNUTLS_CERT_INVALID: The self signature on the key is invalid.
 *
 * Returns 0 on success.
 **/
int
gnutls_openpgp_crt_verify_self (gnutls_openpgp_crt_t key,
				unsigned int flags, unsigned int *verify)
{
  int status;
  cdk_error_t rc;

  rc = cdk_pk_check_self_sig (key->knode, &status);
  if (rc || status != CDK_KEY_VALID)
    *verify |= GNUTLS_CERT_INVALID;
  else
    *verify = 0;

  return 0;
}

